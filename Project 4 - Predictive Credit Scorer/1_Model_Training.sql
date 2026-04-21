CREATE OR REPLACE MODEL `Credit_Risk.Credit_Scoring_Model`
OPTIONS(model_type = 'logistic_reg', input_label_cols = ['Defaulted']) AS
SELECT
  Monthly_Income,
  Years_Employed,
  Debt_to_Income_Ratio,
  Has_Prior_Default,
  Defaulted
FROM
  `Credit_Risk.Historical_Loan_Data`