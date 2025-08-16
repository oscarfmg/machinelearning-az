#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Aug 15 22:58:59 2025

@author: oscarfmg
"""

# Regresion Linear Simple

# Importando las bibliotecas necesarias
import numpy as np  # Para manejo de vectores y matrices
import matplotlib.pyplot as plt  # Para visualización de datos (aunque no se usa aquí)
import pandas as pd  # Para manipulación y análisis de datos

# Importar el dataset
dataset = pd.read_csv('Salary_Data.csv')

# Variables independientes (X) y variable objetivo (y)
# Seleccionamos todas las columnas excepto la última como variables independientes (X)
X = dataset.iloc[:, :-1].values
# Seleccionamos la última columna como la variable objetivo (y)
y = dataset.iloc[:, 1].values


# Dividir el dataset en conjunto de entrenamiento y conjunto de prueba
from sklearn.model_selection import train_test_split

# Dividimos los datos: 80% para entrenamiento y 20% para prueba
# random_state asegura que los resultados sean reproducibles
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=1/3, random_state=0)


# Crear modelo de Regresion Linear Simple con el conjunto de entrenamiento
from sklearn.linear_model import LinearRegression
regression = LinearRegression()
regression.fit(X_train, y_train)

# Predecir el conjunto de test
y_pred = regression.predict(X_test)

# Visualizar los resultados de prediccion
plt.scatter(X_train,y_train, color='red')
plt.plot(X_train, regression.predict(X_train), color='blue')
plt.title('Sueldo vs  Años de experiencia (Conjunto de entrenamiento)')
plt.xlabel('Años de experiencia')
plt.ylabel('Sueldo (en $)')
plt.show()
