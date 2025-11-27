# Variable Dictionary for FP3 NSDUH Project
This file gives a description of each variable used in the new dataset after cleaning.

## Outcome
### **MJDAY30A_binary**
Any marijuana use in the past 30 days  
- 0 = no use  
- 1 = any use  

## Exposure
### **RSKMRJWK**
perceived risk of smoking marijuana once or twice a week  
- 1 = no risk  
- 2 = slight risk  
- 3 = moderate risk  
- 4 = great risk  

## Covariates
### **AGE3**
age group (adolescents)  
- 1 = ages 12–13  
- 2 = ages 14–15  
- 3 = ages 16–17  

### **IRSEX**
- 0 = male  
- 1 = female  

### **YFLMJMO**
peer disapproval of marijuana use  
- 1 = disapprove  
- 0 = neutral/permissive  
- NA = unknown or not asked  

### **YEPMJMO**
parental disapproval of marijuana use  
- 1 = disapprove (somewhat or strongly)  
- 0 = neutral  
- NA = skipped / missing  

***All special NSDUH missing codes (85, 94, 97, 98, 99) were recoded to NA.***
***All categorical variables were converted to factors in R.***
***These variables form the final analytic dataset used for modeling.***










