## Usé Power Query para limpiar

### DETECCION Y TRATADO DE NULOS | CAMBIO DE TIPO DE DATO | CAMBIO DE NOMBRES DE VARIABLES:
    - Cambiar los tipos de datos erroneos (esto se documentó en la etapa 2)
    - En la tabla 'Productos' hice primero el remplazo de ',' por '.' ya que al cambiar el tipo de dato de texto '12,24' a decimal salía como 1224
     por ello hice el remplazo usando Trasformar > Remplazar los valores > busqué ',' y remplaze por '.' y luego cambie el tipo de dato a float/decimal.
     Tambien hice el cambio en tipo de dato de la columna 'stock' de str a int.
    - En la tabla 'Ventas' se hizo el cambio de dato en la columna 'Fecha' de str a 'date'.
    - Cambiar los nombres erroneos de las columnas en este caso en "Fecha_Resgistro" por "Fecha_Registro" (esto se documentó en la etapa 2)
    - Identificar Valores Nulos usando Power Query - No se encontraron NULOS | VACIOS - Validos 100%, Error 0%, Vacios 0%

### DETECCION DE DUPLICADOS + TRATAMIENTO
    - Hice la deteccion de duplicados usando seleccion de tabla > Formato Condicional > Reglas para resaltar celdas > Valores Duplicados para luego Aplicar
    el filtro por color.
    - No se encontraron duplicados en las tablas Clientes | Categorias | Metodo de Pago | Productos
    - En la tabla Ventas si se encontraron 29 duplicados
        Ejemplo:  680	04/02/2024	112	37	2	5	Completa
                  680	04/02/2024	112	37	2	5	Completa
    - Se eliminaron estos duplicados: Seleccioné la tabla > Datos > Quitar Duplicados.

### LIMPIEZA DE DATOS
    - No hubo textos que corregir y por tanto no hice uso de PROPER | TRIM
    - Estandarizar fechas:
        En la tabla clientes(fecha_registro) se hizo el cambio de DD-MM-YYYY a YYYY-MM-DD siguiendo estos pasos: Seleccion de columna, CTRL + 1 > Buscamos en fecha: 2012-03-14 > Aceptar
        En la tabla ventas(Fecha) se aplicó lo mismo

### VALIDACION TIPOS DE DATOS
    - No hay cantidades negativas, se hizo la revisión usando filtros aplicado a columna por columna
    - No hay valores fuera de rango, se hizo la revisión usando formato condicional y filtros
    - Hice la validacion de datos usando: Datos → Validación de datos → configuras reglas. Ejemplo: columna Cantidad solo acepta números enteros ≥ 1. Si alguien intenta poner -1 o texto, Excel lo rechaza con un mensaje de error.
        Esto lo aplique para la mayoria de columnas en el dataset:
---

## 📋 Cheatsheet — Limpieza de datos en Excel

---

### 1️⃣ Filtros — detectar cantidades negativas o raras

| Tarea | Pasos |
|---|---|
| Activar filtros | Selecciona encabezados → `Datos → Filtro` |
| Ver extremos | Flecha de columna → `Ordenar de mayor a menor` y al revés |
| Filtrar negativos | Flecha → `Filtros de número → Menor que → 0` |
| Quitar filtro | `Datos → Borrar` |

---

### 2️⃣ Formato condicional — valores fuera de rango

| Tarea | Pasos |
|---|---|
| Resaltar valores mayores a X | Selecciona columna → `Inicio → Formato condicional → Resaltar reglas → Es mayor que...` → ingresa límite → color → Aceptar |
| Rango personalizado (fórmula) | Formato condicional → `Nueva regla → Usar fórmula` → ej: `=O(A2<1, A2>100)` → color → Aceptar |
| Ver solo celdas marcadas | Filtro → `Filtrar por color` |
| Eliminar reglas | `Inicio → Formato condicional → Borrar reglas → De la selección` |

---

### 3️⃣ Validación de datos — prevenir errores futuros

| Tarea | Pasos |
|---|---|
| Abrir validación | Selecciona columna → `Datos → Validación de datos` |
| Solo enteros ≥ 1 (ej. Cantidad) | Permitir: `Número entero` → Mayor o igual que → `1` |
| Decimales en rango (ej. Precio) | Permitir: `Decimal` → Entre → `0.01` y `9999` |
| Agregar mensaje de error | Pestaña `Mensaje de error` → Estilo: `Detener` → escribe tu mensaje |
| Quitar validación | `Datos → Validación de datos → Borrar todos → Aceptar` |

---
OTRA OPCIÓN ES USAR PYTHON
[Ver el notebook](../notebooks/cleaning.ipynb)
