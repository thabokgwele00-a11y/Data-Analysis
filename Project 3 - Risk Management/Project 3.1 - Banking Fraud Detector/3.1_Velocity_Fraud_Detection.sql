WITH CTE_First AS (
  SELECT *, AVG(Amount) OVER(PARTITION BY Customer_ID ORDER BY Transaction_Timestamp ROWS BETWEEN 10 PRECEDING AND 1 PRECEDING) AS Rolling_Avg
  FROM `Fraud_Detection.Fact_Transactions`
)
SELECT
  *
FROM
  CTE_First
WHERE
  Amount > (Rolling_Avg * 5)