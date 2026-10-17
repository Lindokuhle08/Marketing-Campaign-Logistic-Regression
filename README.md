
# Marketing Campaign Response Analysis Using Logistic Regression

Which customers said "yes" to a supermarket's latest marketing campaign? This project uses **logistic regression in SAS** to identify the customer characteristics and past behaviours that predict acceptance of **Marketing Campaign 6**.

*STAT305 group project (Group D), University of KwaZulu-Natal.*

## About the Data

The data comes from a supermarket chain's loyalty programme. Every time a customer shops, their loyalty card records the spend. Each customer was exposed to 6 marketing campaigns, and their response to each (accepted or not) was recorded.

- **Observations:** 2,008 customers
- **Variables:** 15
- **Response variable:** `AcceptedCmp6` (Yes/No)
________________________________________________________________________________________________________________________________________________________
| Variable                                                                | Description                                               | Type            |
|-------------------------------------------------------------------------|-----------------------------------------------------------|-----------------|
| Education                                                               | Highest education level (Basic, Graduation, Master, PhD)  | Categorical     |
|-------------------------------------------------------------------------|-----------------------------------------------------------|-----------------|
| Marital_Status                                                          | Marital status of the customer                            | Categorical     |
|-------------------------------------------------------------------------|-----------------------------------------------------------|-----------------|
| Income                                                                  | Annual household income (in dollars)                      | Quantitative    |
|-------------------------------------------------------------------------|-----------------------------------------------------------|-----------------|
| Teenhome                                                                | Number of teenagers living with the customer              | Quantitative    |
|-------------------------------------------------------------------------|-----------------------------------------------------------|-----------------|
| MntWines, MntFruits, MntMeatProducts, MntFishProducts, MntSweetProducts | Amount spent on each product type over the past two years | Quantitative    |
|-------------------------------------------------------------------------|-----------------------------------------------------------|-----------------|
| AcceptedCmp1 – AcceptedCmp6                                             | Whether the customer accepted each campaign               | Binary (Yes/No) |
_________________________________________________________________________________________________________________________________________________________

## Methods

1. **Descriptive statistics:** one-way frequency tables and summary measures for all variables.
2. **Chi-square tests of association** (`PROC FREQ`) between each categorical predictor and `AcceptedCmp6` (α = 0.05).
3. **Logistic regression** (`PROC LOGISTIC`): a full model with all predictors, then a reduced model after removing non-significant variables (MntWines, MntFruits, MntFishProducts, MntSweetProducts, AcceptedCmp2).

## Key Results

- Only about **15.3%** of customers accepted Campaign 6.
- Education, marital status and every previous campaign were significantly associated with Campaign 6 acceptance (all p ≤ 0.0002).

**Reduced model fit:** AIC = 1350.22, Hosmer-Lemeshow χ² = 12.78 (p = 0.12, good fit), c-statistic (AUC) = 0.810.
_____________________________________________________________________________________________________
| Predictor                          | Odds Ratio | 95% CI         | Interpretation                 |
|------------------------------------|------------|----------------|--------------------------------|
| Education (PhD vs Basic)           | 7.28       | (1.66, 31.90)  | Strong positive effect         |
|------------------------------------|------------|----------------|--------------------------------|
| Marital_Status (Single vs Married) | 2.77       | (1.93, 3.99)   | Singles more likely            |
|------------------------------------|------------|----------------|--------------------------------|
| Teenhome                           | 0.61       | (0.45, 0.82)   | Fewer teenagers → higher odds  |
|------------------------------------|------------|----------------|--------------------------------|
| MntMeatProducts                    | 1.002      | (1.001, 1.002) | Small positive effect per unit |
|------------------------------------|------------|----------------|--------------------------------|
| AcceptedCmp3 (Yes vs No)           | 7.05       | (4.69, 10.60)  | Very strong positive effect    |
_____________________________________________________________________________________________________

## Conclusion

The customer most likely to accept Campaign 6 is **highly educated** (especially PhD and Master's holders), **single, divorced or widowed**, **has no teenagers at home**, and already **spends more on products like meat**. The strongest predictor was **past engagement**: customers who accepted earlier campaigns were far more likely to respond again.

## Tools

SAS (`PROC IMPORT`, `PROC FREQ`, `PROC LOGISTIC`)

*members:*
*Lindokuhle Machangu,*
*Sthembelo Meyiwa,*
*Luyanda Myeza, &*
*Phakamani Majola*
