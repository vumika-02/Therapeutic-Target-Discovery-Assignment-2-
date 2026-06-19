# Assignment 1
# R for Bioinformatics & Transcriptomic Data Analysis
library(tidyverse)
expression_data <- read.csv("raw_expression_matrix (1).csv")

clinical_data <- read.csv("raw_clinical_metadata (1).csv")
print(expression_data)

print(clinical_data)

clinical_data <- data.frame(
  Patient_ID = c("PT-01","PT-02","PT-03","PT-04",
                 "PT-05","PT-06","PT-07","PT-08",
                 "PT-09","PT-10","PT-11","PT-12"),
  Age = c("34","45","fifty-two","61","28","41","sixty-seven","50","38","55","47","63"),
  condition = c("Normal","Normal","Normal","Normal","Normal","Normal","Tumor","Tumor","Tumor","Tumor","Tumor"," "),
  stringsAsFactors = FALSE
)
clinical_data
library(dplyr)
library(readr)
clinical <- read_csv("raw_clinical_metadata (1).csv")
expression <- read_csv("raw_expression_matrix (1).csv")
clinical <- clinical %>%
  mutate(Sample_Ref = gsub("-", "_", Patient_ID))
  clinical <- clinical %>%
  mutate(Age = recode(Age,
                      "fifty-two" = "52",
                      "sixty-seven" = "67")) %>%
  mutate(Age = as.numeric(Age))
  clinical <- clinical %>%
  filter(Condition != "" & !is.na(Condition))
master <- clinical %>%
  inner_join(expression, by = "Sample_Ref")
  
  library(tidyr)

master_long <- master %>%
  pivot_longer(cols = c(Gene_A, Gene_B, Gene_C),
               names_to = "Biomarker",
               values_to = "Expression")
library(ggplot2)

ggplot(master_long, aes(x = Condition, y = Expression, fill = Condition)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(alpha = 0.6, width = 0.1) +
  facet_wrap(~Biomarker, scales = "free_y") +
  scale_fill_manual(values = c("Normal" = "#1f77b4", "Tumor" = "#ff7f0e")) +
  theme_bw()
library(ggplot2)

ggplot(master_long, aes(x = Condition, y = Expression, fill = Condition)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(alpha = 0.6, width = 0.1) +
  facet_wrap(~Biomarker, scales = "free_y") +
  scale_fill_manual(values = c("Normal" = "#1f77b4", "Tumor" = "#ff7f0e")) +
  theme_bw() +
  labs(title = "Biomarker Expression by Condition",
       x = "Condition",
       y = "Expression Level")
save.image("First Assignment.RData")
C:/Program Files/Git/bin/git.exe


