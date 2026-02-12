# Neurogenomics Statistical Analysis
# Author: Janice Roberta de Paula

library(readr)
library(dplyr)
library(ggplot2)

# Load dataset
data <- read_csv("data/neuro_sample.csv")

print(head(data))

# Correlation matrix
cor_matrix <- cor(data)
print(cor_matrix)

# Linear regression: symptom severity ~ biological + environmental factors
model <- lm(symptom_severity ~ age + gene_score + miRNA_1 + miRNA_2 + stress_index, data = data)

summary(model)

# Visualization: Stress vs Symptoms
ggplot(data, aes(x = stress_index, y = symptom_severity)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_minimal() +
  labs(title = "Stress Index vs Symptom Severity",
       x = "Stress Index",
       y = "Symptom Severity")
