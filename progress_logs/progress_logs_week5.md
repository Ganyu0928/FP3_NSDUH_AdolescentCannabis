# Week 5 progrss log
This week is the final week for wrapping everything together. I finalized all modeling components, completed the full descriptive and regression results, updated Table 1 with readable labels, and integrated all analyses into the final R Markdown file. All files pushed to Github for reproducibility. 

## Task
- reloaded the analytic dataset and verified all factors levels and variable recoding.
- added readable labels for each variable. 
- generated updated descriptive outputs: 
  - using table1() with labeled variables.
  - descriptive summaries for perceived risk, peer disapproval, and parent disapproval. 
  - exported updated tables and DAG figure to each output and docs folder.
- completed all logistic regression models:
  - model 1: unadjusted association between perceived risk and marijuana use.
  - model 2: adjusted for age and sex. 
  - model 3: fully adjusted (age, sex, peer and parent disapproval)
  - extracted odds ratios and 95% CIs using summary() and odds.n.ends().
- tested effect modification: 
  - added interaction term (perceived risk x sex).
  - determine the interaction was not statistically significant.
- produced final results:
  - proportional bar chart of perceived risk vs. marijuana use.
  - verified and exported the figure for inclusion in the report/ppt.
  - DAG figure demostrating the association between each variable.
- integrated all methods, tables, figures, and model outputs into the final RMD file. 
- updated README and added week 5 progress log to Github.
- finish the presentation with all findings. 