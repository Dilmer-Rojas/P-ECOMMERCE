
---

# Proyecto de Análisis de Datos E-commerce & Business Intelligence

### 📌 Rol asignado

**Analista de Datos / BI Analyst**

**Por: Laureano Rojas Castañeda**

## 1. Definición del Problema y Objetivos

🚀 *Definición del Problema*
"¿Cómo podemos aumentar la rentabilidad del e-commerce optimizando el inventario y personalizando la experiencia del cliente, identificando:
- Productos estrella por región y categoría
- Clientes con mayor potencial de compra recurrente
- Patrones de compra según método de pago y estacionales?"

💡 *Objetivos clave:*
- Maximizar ventas en regiones/productos de alta demanda
- Reducir stock de productos de baja rotación
- Mejorar estrategias de marketing por segmento de cliente

## 2. Identificación de Indicadores

📊 *Indicadores Clave (KPIs)*

Para abordar el problema "¿Cómo aumentar la rentabilidad del e-commerce optimizando el inventario y personalizando la experiencia del cliente?", estos son algunos KPIs relevantes:

1. **Ventas Totales por Región y Categoría**
    - *Objetivo*: Identificar mercados con mayor potencial.
    - Cálculo: `SUM(Ventas.Cantidad * Productos.Precio_Unitario)`
2. **Tasa de Rotación de Stock**
    - *Objetivo*: Detectar productos con riesgo de desabastecimiento o exceso.
    - Cálculo: `Ventas.Cantidad / Productos.Stock`
3. **Ticket Promedio por Cliente y Método de Pago**
    - *Objetivo*: Optimizar estrategias de pago y segmentación.
    - Cálculo: `SUM(Ventas.Cantidad * Productos.Precio_Unitario) / COUNT(DISTINCT Ventas.ID_Cliente)`
4. **Clientes Recurrentes vs. Únicos**
    - *Objetivo*: Focarse en retención vs. captación.
    - Cálculo: `COUNT(Ventas.ID_Cliente)` (con más de 1 compra)
5. **Margen de Ganancia por Producto**
    - *Objetivo*: Priorizar productos más rentables.
    - Cálculo: `(Ventas.Cantidad * (Productos.Precio_Unitario - Costo_Unitario))`

## 3. Recolección de Datos

🗃 *Recolección de los Datos a Usar*

Para este proyecto usamos un dataset de "Kaggle":

[Dataset Usado](https://www.kaggle.com/datasets/dataregina/datasets-para-proyecto-bi)

**Descripción Breve del Dataset**

**Tablas incluidas**

1. **Ventas** Contiene el detalle de cada transacción.

- ID_Venta: Identificador único de la venta.
- Fecha: Fecha de la transacción.
- ID_Cliente: Identificador del cliente.
- ID_Producto: Identificador del producto.
- Cantidad: Número de unidades vendidas.
- Método_Pago: Medio de pago utilizado.
- Estado: Estado de la transacción (Completa, Pendiente, Cancelada).

2. **Clientes** Información general de los clientes.

- ID_Cliente: Identificador único.
- Nombre, Apellido, Correo electrónico: Datos personales.
- Fecha_Registro: Fecha de alta en la plataforma.
- Región: Ubicación geográfica.

3. **Productos** Listado de productos disponibles.

- ID_Producto: Identificador único.
- Nombre_Producto: Nombre del artículo.
- ID_Categoría: Clave foránea hacia tabla de categorías.
- Precio_Unitario: Precio del producto.
- Stock: Inventario disponible.

4. **Métodos_Pago** Listado de medios de pago posibles.

- ID_Método: Identificador.
- Método: Nombre del método (ej. Tarjeta, PayPal).
- Descripción: Explicación breve del método.

5. **Categorías_Productos** Clasificación de productos por tipo.

- ID_Categoría: Identificador único.
- Categoría: Nombre (ej. Lácteos, Carnicería).
- Descripción: Breve explicación del grupo.


## 4. Limpieza de Datos

**🧹 Limpieza | Data Cleaning (Python y SQL)**:

- [Notebook Data Cleaning - Python](./notebooks/Data_Cleaning_Python.ipynb)
- [Query Data Cleaning - SQL - MySQL Server](./sql/cleanin.sql)


## 5. Análisis Exploratorio de Datos (EDA)

## 6. Visualización y Comunicación

## 7. Toma de Decisiones

---
