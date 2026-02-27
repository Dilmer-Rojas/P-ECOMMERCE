## Acerca del conjunto de datos
**Conjunto de datos**: Análisis de Ventas para E-commerce (BI Consulting)
Este conjunto de datos fue diseñado como parte de un trabajo práctico integrador para un curso de Business Intelligence con herramientas como Google Sheets y Looker Studio. Simula el funcionamiento de una empresa de comercio electrónico, permitiendo a los estudiantes aplicar conceptos de BI a través del análisis de transacciones, comportamiento de clientes y rendimiento de productos.

El conjunto de datos puede utilizarse para tareas de limpieza de datos, análisis exploratorio, creación de informes y diseño de paneles interactivos.

Tablas incluidas
1. Ventas: Contiene el detalle de cada transacción.

- **ID_Venta**: Identificador único de la venta.
- **Fecha**: Fecha de la transacción.
- **ID_Cliente**: Identificador del cliente.
- **ID_Producto**: Identificador del producto.
- **Cantidad**: Número de unidades vendidas.
- **Método_Pago**: Medio de pago utilizado.
- **Estado**: Estado de la transacción (Completa, Pendiente, Cancelada).

2. Clientes: Información general de los clientes.

- **ID_Cliente**: Identificador único.
- **Nombre, Apellido, Correo electrónico**: Datos personales.
- **Fecha_Registro**: Fecha de alta en la plataforma.
- **Región**: Ubicación geográfica.

3. Productos: Listado de productos disponibles.

- **ID_Producto**: Identificador único.
- **Nombre_Producto**: Nombre del artículo.
- **ID_Categoría**: Clave foránea hacia tabla de categorías.
- **Precio_Unitario**: Precio del producto.
- **Stock**: Inventario disponible.

4. Métodos_Pago: Listado de medios de pago posibles.

- **ID_Método**: Identificador.
- **Método**: Nombre del método (ej. Tarjeta, PayPal).
- **Descripción**: Explicación breve del método.

6. Categorías_Productos Clasificación de productos por tipo.

- **ID_Categoría**: Identificador único.
- **Categoría**: Nombre (ej. Lácteos, Carnicería).
- **Descripción**: Breve explicación del grupo.

## 💡 Posibilidades de Análisis
Ventas totales por producto, cliente o categoría.
Comparativas de métodos de pago.
Comportamiento por región.
Evaluación de stock vs ventas.
Visualización temporal de ingresos y unidades vendidas.
