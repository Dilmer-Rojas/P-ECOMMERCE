# Arquitectura del Proyecto

## Resumen ejecutivo
Este proyecto centraliza el pipeline de datos de e-commerce para generar KPIs ejecutivos (ventas, clientes activos, predicción de ventas). Objetivo: entregar información confiable y reproducible para decisiones estratégicas.

## Diagrama principal
![ERD - Esquema Estrella](docs/diagrams/erd_star_schema.png)
**Figura:** ERD en estrella — `Fact_Ventas` con dimensiones `Dim_Fecha`, `Dim_Cliente`, `Dim_Producto`, `Dim_MetodoPago`, `Dim_Estado`.
**Versión del diagrama:** v1 — 2026-02-22 — Responsable: Nombre

## Flujo de datos
- Origen: archivos CSV en `data/raw/`.
- ETL: scripts en `src/etl/` (extract → transform → load).
- Almacenamiento procesado: `data/processed/` (parquet).
- Consumo: `dashboard/` (Streamlit) y `models/` (modelos en `models/trained/`).

## Componentes y responsabilidades
- `src/etl/`: limpieza y uniones (responsable: X).
- `src/modeling/`: entrenamiento y evaluación (responsable: Y).
- `dashboard/`: visualización ejecutiva (responsable: Z).

## Formatos y almacenamiento
- Raw: CSV
- Procesado: Parquet particionado por `fecha_key`
- Modelos: `joblib` en `models/trained/`

## Orquestación y despliegue
- Pipelines locales: `src/main.py` para pruebas.
- Producción: (opcional) Airflow / Azure Data Factory / GitHub Actions.

## Versionado y gobernanza
- ERD: `docs/diagrams/erd_star_schema_v1.png`
- Cambios: registrar fecha, responsable y resumen de cambios.

## Notas / Próximos pasos
- Añadir pruebas de calidad de datos (Great Expectations).
- Automatizar ETL con scheduler.