This folder contains all R scripts used for data cleaning, descriptive analysis, and modeling for the FP3 project **“Perceived Risk and Marijuana Use Among U.S. Adolescents (NSDUH 2023)”**.

---

## Script Descriptions

| File Name | Purpose | Output(s) |
|------------|----------|------------|
| **01_data_cleaning.R** | Loads the raw NSDUH 2023 dataset, selects key variables (`RSKMRJWK`, `MJDAY30A`, `IRSEX`), and recodes marijuana use into a binary variable (0 = No, 1 = Yes). | `data_clean/nsduh_2023_clean.Rdata`, `data_clean/nsduh_2023_clean.csv` |
| **02_descriptive_analysis.R** | Performs descriptive and bivariate analyses. Generates frequency tables for main variables and cross-tabulations for perceived risk × marijuana use (and stratified by sex). | `output/descriptive_table1.csv`, `output/descriptive_table2.csv` |
| **03_logistic_models.R** *(upcoming)* | Will conduct logistic regression analyses to examine the association between perceived risk and marijuana use, including interaction term (perceived risk × sex) and covariates. | `output/model_results.csv` (planned) |

---

## Notes
- All scripts are written in **R** and use the **tidyverse** package for data handling.  
- Each script can be run independently once the project folder structure is set up.  
- File paths are relative (e.g., `"data_clean/nsduh_2023_clean.Rdata"`), ensuring full reproducibility.  
- Outputs are automatically saved to the `/output` folder.

---

##  Reproducibility Workflow
1. **Run** `scripts/01_data_cleaning.R` → creates clean dataset  
2. **Run** `scripts/02_descriptive_analysis.R` → generates summary tables  
3. **Run** `scripts/03_logistic_models.R` *(in progress)* → performs main regression analysis  

# Test commit - verifying git setup for week4
