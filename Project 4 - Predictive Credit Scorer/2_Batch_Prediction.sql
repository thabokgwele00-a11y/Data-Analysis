WITH CTE_First AS (
  SELECT * FROM ML.PREDICT(MODEL `Credit_Risk.Credit_Scoring_Model`, (SELECT * FROM `Credit_Risk.New_Loan_Applicants`))
),
CTE_Second AS (
  SELECT
  Applicant_ID, (SELECT p.prob FROM UNNEST(predicted_Defaulted_probs) p WHERE label = 1) AS Default_Probability
FROM
  CTE_First
)
SELECT
  *
FROM
  CTE_Second
WHERE
  Default_Probability > 0.7