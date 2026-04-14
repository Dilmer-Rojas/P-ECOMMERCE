# Paso 1 — importar librerías esenciales
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Paso 2 — cargar los archivos
clientes = pd.read_csv('../data/raw/clientes.csv')
categorias = pd.read_csv('../data/raw/categorias.csv')
metodos_pago = pd.read_csv('../data/raw/metodos_pago.csv')
productos = pd.read_csv('../data/raw/productos.csv')
ventas = pd.read_csv('../data/raw/ventas.csv')

# Paso 3 — primer vistazo correcto
dataframes = {
    "clientes": clientes,
    "categorias": categorias,
    "metodos_pago": metodos_pago,
    "productos": productos,
    "ventas": ventas
}

for nombre, df in dataframes.items():
    print(f"\n{'='*50}")
    print(f"TABLA: {nombre.upper()}")
    print(f"{'='*50}")
    print(f"Shape: {df.shape}") # filas y columnas
    print(f"\nPrimeras 5 filas:")
    print(df.head())
    print(f"\nTipos de dato:")
    print(df.dtypes)
    print(f"\nResumen general:")
    df.info() # info() ya hace print solo