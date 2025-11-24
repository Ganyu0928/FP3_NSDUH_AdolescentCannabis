# =========================================================================
# FP3 Project: Perceived Risk and Marijuana Use (NSDUH 2023)
# Script: 03_descriptive_analysis.R
# Purpose: finalize analytic dataset, descriptive table, and model (Week 4)
# =========================================================================

# 1. Clear workspace 
rm (list = ls())

# 2. Load packages using pacman
pacman::p_load(ggplot2, car, odds.n.ends, readr, dplyr, tidyr)

# 3. Set file paths
data_path <- "data_clean"
output_path <- "output"

# 4. Load data
load(file.path(data_path, "nsduh_2023_clean.RData"))  # reload fresh

# 5. check dataset
str(data_clean)
summary(data_clean)

# 6. Make sure MJDAY30A is a factor (RSKMRJWK & IRSEX already recoded in 01_data_clean)
data_clean <- data_clean %>%
  mutate(
    MJDAY30A = factor(MJDAY30A,
                      levels = c(0, 1),
                      labels = c("No use", "Used"))
  )

summary(data_clean)

# 7. Descriptive statistics
print(table(data_clean$RSKMRJWK, useNA = "always"))
print(table(data_clean$MJDAY30A, useNA = "always"))
print(table(data_clean$IRSEX, useNA = "always"))

# 8. Cross-tab perceived risk * marijuana use
tab_risk_use <- table(data_clean$RSKMRJWK, data_clean$MJDAY30A, useNA = "always")
tab_risk_use

# 9. Row percentages
round(prop.table(tab_risk_use, margin = 1) * 100, 1)

# 10. Save descriptive table
write.csv(as.data.frame(tab_risk_use),
          file = file.path(output_path, "table1_risk_vs_use.csv"),
          row.names = FALSE)

# 11. Analytic dataset for complete case analysis
analytic <- data_clean %>%
  filter(!is.na(RSKMRJWK),
         !is.na(MJDAY30A),
         !is.na(IRSEX))

nrow(data_clean)
nrow(analytic)
100 - nrow(analytic) / nrow(data_clean) * 100  # percent dropped

save(analytic, file = file.path(data_path, "FP3_analytic_week4.RData"))

# Optional: age distribution in analytic dataset
table(analytic$AGE3, useNA = "always")

# 12. Logistic regression models

# Unadjusted model
model1 <- glm(MJDAY30A ~ RSKMRJWK,
              data = analytic,
              family = "binomial")
summary(model1)
odds.n.ends(model1)

# Adjusted model (control for sex)
model2 <- glm(MJDAY30A ~ RSKMRJWK + IRSEX,
              data = analytic,
              family = "binomial")
summary(model2)
odds.n.ends(model2)

# 13. Visualization 
ggplot(analytic, aes(x = RSKMRJWK, fill = MJDAY30A)) +
  geom_bar(position = "fill") +
  labs(
    title = "Marijuana Use by Perceived Risk (Adolescents, NSDUH 2023)",
    x = "Perceived risk of smoking marijuana weekly",
    y = "Proportion within risk group",
    fill = "Past 30-day use"
  ) +
  theme_bw()

ggsave(file.path(output_path, "Figure1_risk_vs_use.png"),
       width = 7, height = 5)

# 14. Save model objects
save(model1, model2, file = file.path(output_path, "FP3_models_week4.RData"))






