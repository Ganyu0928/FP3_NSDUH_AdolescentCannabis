# =========================================================================
# Project: Perceived Risk and Marijuana Use (NSDUH 2023)
# Script: 04_logistic_modeling.R
# Purpose: Logistic Regression Analyses (Week 5)
# =========================================================================

# 1. Clear worksapce
rm(list = ls())

# 2. Load packages using pacman
pacman::p_load(tidyverse,broom,car,lmtest,odds.n.ends,jtools)

# 3. Set file paths
data_path <- "data_clean"
output_path <- "output"

# 4. Load cleaned analytic dataset (generated in week 4)
load("data_clean/FP3_analytic_week4.RData")

# 5. Check dataset
str(analytic)
summary(analytic)

# 6. Ensure factors are correctly set
analytic <- analytic %>%
  mutate(
    RSKMRJWK = factor(RSKMRJWK),
    IRSEX    = factor(IRSEX)
  )

# 7. Model 1: Unadjusted logistic regression
model1 <- glm(
  MJDAY30A ~ RSKMRJWK,
  data   = analytic,
  family = "binomial"
)

summary(model1)
odds.n.ends(model1)

# Save model
saveRDS(model1, file.path(output_path, "model1_unadjusted.rds"))

# 8. Model 2: Adjusted for sex (IRSEX)
model2 <- glm(
  MJDAY30A ~ RSKMRJWK + IRSEX,
  data   = analytic,
  family = "binomial"
)

summary(model2)
odds.n.ends(model2)

saveRDS(model2, file.path(output_path, "model2_adjusted.rds"))

# LR test: does adding sex improve fit?
lrtest(model1, model2)

# 9. Multicollinearity check (VIF)
vif(model2)

# 10. Influence diagnostics — Cook’s Distance
plot(model2, which = 4, id.n = 3, col = "pink")
abline(h = 1, col = "pink", lty = 2)

# Extract data with Cook’s D
model2_data <- augment(model2) %>%
  mutate(index = 1:n())

# Rule: influential if Cook’s D > 1
cutoff <- 1

analytic_noinf <- model2_data %>% 
  filter(.cooksd < cutoff)

# Check percent kept
nrow(analytic_noinf) / nrow(analytic)

# 11. Refit model after removing influential observations
model2_refit <- glm(
  MJDAY30A ~ RSKMRJWK + IRSEX,
  data   = analytic_noinf,
  family = "binomial"
)

summary(model2_refit)
odds.n.ends(model2_refit)

# Compare coefficients before/after exclusion
car::compareCoefs(model2, model2_refit)

saveRDS(model2_refit, file.path(output_path, "model2_no_influential.rds"))

# 12.Model performance plots
# Predicted probability plot
odds.n.ends(model2, predProbPlot = TRUE)

# ROC curve
odds.n.ends(model2, rocPlot = TRUE)

# 13. Effect Modification by Sex (RSKMRJWK * IRSEX)
# Interaction model
model3_int <- glm(
  MJDAY30A ~ RSKMRJWK * IRSEX,
  data   = analytic,
  family = "binomial"
)

summary(model3_int)
odds.n.ends(model3_int)

# Save interaction model
saveRDS(model3_int, file.path(output_path, "model3_interaction.rds"))

# Compare main-effects model vs interaction model
lrtest(model2, model3_int)

# 14. Model performance for interaction model (Predicted probabilities with interaction)
odds.n.ends(model3_int, predProbPlot = TRUE)

# ROC curve for interaction model
odds.n.ends(model3_int, rocPlot = TRUE)

