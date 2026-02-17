/* =========================================================
   DATA WAREHOUSE MODELO ESTRELLA – VENTAS
   Compatible con SQL Server
========================================================= */

-- 1️⃣ Crear Base de Datos
IF DB_ID('DW_Ventas') IS NULL
BEGIN
    CREATE DATABASE DW_Ventas;
END
GO

USE DW_Ventas;
GO

-- 2️⃣ Crear esquema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dw')
BEGIN
    EXEC('CREATE SCHEMA dw');
END
GO

/* =========================================================
   3️⃣ TABLAS DIMENSIÓN
========================================================= */

-- Dim_Fecha
IF OBJECT_ID('dw.Dim_Fecha') IS NOT NULL DROP TABLE dw.Dim_Fecha;
CREATE TABLE dw.Dim_Fecha (
    fecha_key INT PRIMARY KEY,            -- YYYYMMDD
    fecha DATE NOT NULL,
    anio INT NOT NULL,
    mes INT NOT NULL,
    numero_mes INT NOT NULL,
    nombre_mes NVARCHAR(20) NOT NULL,
    trimestre INT NOT NULL,
    semana INT NOT NULL,
    dia INT NOT NULL,
    dia_semana INT NOT NULL,
    nombre_dia_semana NVARCHAR(20) NOT NULL,
    es_fin_de_semana BIT NOT NULL
);

-- Dim_Cliente
IF OBJECT_ID('dw.Dim_Cliente') IS NOT NULL DROP TABLE dw.Dim_Cliente;
CREATE TABLE dw.Dim_Cliente (
    cliente_key INT IDENTITY(1,1) PRIMARY KEY,
    cliente_id_origen INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    apellido NVARCHAR(100) NOT NULL,
    region NVARCHAR(100),
    fecha_registro DATE,
    tipo_cliente NVARCHAR(50),
    segmento NVARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE,
    es_actual BIT DEFAULT 1
);

-- Dim_Producto
IF OBJECT_ID('dw.Dim_Producto') IS NOT NULL DROP TABLE dw.Dim_Producto;
CREATE TABLE dw.Dim_Producto (
    producto_key INT IDENTITY(1,1) PRIMARY KEY,
    producto_id_origen INT NOT NULL,
    nombre_producto NVARCHAR(150) NOT NULL,
    categoria NVARCHAR(100) NOT NULL,
    precio_lista DECIMAL(18,2),
    estado_producto NVARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE,
    es_actual BIT DEFAULT 1
);

-- Dim_MetodoPago
IF OBJECT_ID('dw.Dim_MetodoPago') IS NOT NULL DROP TABLE dw.Dim_MetodoPago;
CREATE TABLE dw.Dim_MetodoPago (
    metodo_pago_key INT IDENTITY(1,1) PRIMARY KEY,
    metodo_pago_id_origen INT NOT NULL,
    metodo NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(250)
);

-- Dim_Estado
IF OBJECT_ID('dw.Dim_Estado') IS NOT NULL DROP TABLE dw.Dim_Estado;
CREATE TABLE dw.Dim_Estado (
    estado_key INT IDENTITY(1,1) PRIMARY KEY,
    estado_id_origen INT NOT NULL,
    estado NVARCHAR(100) NOT NULL
);

/* =========================================================
   4️⃣ TABLA DE HECHOS
========================================================= */

IF OBJECT_ID('dw.Fact_Ventas') IS NOT NULL DROP TABLE dw.Fact_Ventas;
CREATE TABLE dw.Fact_Ventas (
    venta_id INT NOT NULL,
    fecha_key INT NOT NULL,
    cliente_key INT NOT NULL,
    producto_key INT NOT NULL,
    metodo_pago_key INT NOT NULL,
    estado_key INT NOT NULL,

    cantidad INT NOT NULL,
    precio_unitario DECIMAL(18,2) NOT NULL,
    total_linea AS (cantidad * precio_unitario) PERSISTED,
    costo_unitario DECIMAL(18,2),
    margen_linea AS ((cantidad * precio_unitario) - (cantidad * ISNULL(costo_unitario,0))) PERSISTED,

    CONSTRAINT PK_Fact_Ventas 
        PRIMARY KEY (venta_id, producto_key),

    CONSTRAINT FK_Fact_Fecha 
        FOREIGN KEY (fecha_key) 
        REFERENCES dw.Dim_Fecha(fecha_key),

    CONSTRAINT FK_Fact_Cliente 
        FOREIGN KEY (cliente_key) 
        REFERENCES dw.Dim_Cliente(cliente_key),

    CONSTRAINT FK_Fact_Producto 
        FOREIGN KEY (producto_key) 
        REFERENCES dw.Dim_Producto(producto_key),

    CONSTRAINT FK_Fact_MetodoPago 
        FOREIGN KEY (metodo_pago_key) 
        REFERENCES dw.Dim_MetodoPago(metodo_pago_key),

    CONSTRAINT FK_Fact_Estado 
        FOREIGN KEY (estado_key) 
        REFERENCES dw.Dim_Estado(estado_key)
);

/* =========================================================
   5️⃣ ÍNDICES PARA PERFORMANCE
========================================================= */

CREATE INDEX IX_Fact_Fecha ON dw.Fact_Ventas(fecha_key);
CREATE INDEX IX_Fact_Cliente ON dw.Fact_Ventas(cliente_key);
CREATE INDEX IX_Fact_Producto ON dw.Fact_Ventas(producto_key);

GO
