# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Ajustar el modelo de regresion linear simple con el conjunto de entrenamiento
regressor <- lm(formula = Salary ~ YearsExperience, 
                data = training_set)

# Predecir resultados con el conjunto de test
y_pred <- predict(regressor, newdata = test_set)

# Visualización de los resutlados en el conjunto de entrenamiento
#install.packages("ggplot2")
library(ggplot2)

ggplot() +
  geom_point(aes(x = training_set$YearsExperience,
                 y = training_set$Salary),
             colour = "red") +
  geom_line(aes(x=training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Sueldo vs Años de experiencia (Conjunto de Entrenamiento)") +
  xlab("Años de experiencia") +
  ylab("Sueldo (en $)")

# Visualización de los resultados en el conjunto de testing
ggplot() +
  geom_point(aes(x = test_set$YearsExperience,
                 y = test_set$Salary),
             colour = "red") +
  geom_line(aes(x=training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Sueldo vs Años de experiencia (Conjunto de Testing)") +
  xlab("Años de experiencia") +
  ylab("Sueldo (en $)")
