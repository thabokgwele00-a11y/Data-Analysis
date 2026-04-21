WITH CTE_First AS (
  SELECT *, DATE_DIFF(CURRENT_DATE, Payment_Due_Date, DAY) AS Days_Past_Due, ROUND((((Principal_Amount) * 1.00) * (Annual_Interest_Rate / 12)), 2) AS Monthly_Interest_Accrual
  FROM `Credit_Risk.Fact_Loans`
),
CTE_Second AS (SELECT
  *,
  CASE
    WHEN Days_Past_Due = 0 THEN 'Current'
    WHEN Days_Past_Due BETWEEN 1 AND 30 THEN 'Stage 1(Late)'
    WHEN Days_Past_Due BETWEEN 31 AND 90 THEN 'Stage 2(Arrears)'
    ELSE 'Stage 3(Default/NPL)'
    END AS Arrears_Bucket
FROM
  CTE_First
),
CTE_Third AS (
  SELECT *,
    CASE
      WHEN (Arrears_Bucket = 'Current' OR Arrears_Bucket = 'Stage 1(Late)') THEN ROUND((Principal_Amount * 0.02), 2)
      WHEN Arrears_Bucket = 'Stage 2(Arrears)' THEN ROUND((Principal_Amount * 0.15), 2)
      ELSE ROUND((Principal_Amount * 0.5), 2)
      END AS Expected_Credit_Loss_Provision
  FROM CTE_Second
)
SELECT
  Arrears_Bucket, ROUND(SUM(Principal_Amount), 2) AS Total_Principal_Outstanding, ROUND(SUM(Expected_Credit_Loss_Provision), 2) AS Total_Provision_Required
FROM
  CTE_Third
GROUP BY
  Arrears_Bucket