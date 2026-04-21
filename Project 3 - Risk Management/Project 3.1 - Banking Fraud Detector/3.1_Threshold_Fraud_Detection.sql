WITH CTE_First AS (
    SELECT *
    FROM  `Fraud_Detection.Fact_Transactions`
    WHERE Amount = 999.99
),
CTE_Second AS (
    SELECT *, LAG(Transaction_Timestamp, 2) OVER(PARTITION BY Customer_ID ORDER BY Transaction_Timestamp) AS Third_Last_Txn
    FROM CTE_First
)
SELECT
  Customer_ID, COUNT(*) AS Transaction_Count
FROM
  CTE_Second
WHERE
  TIMESTAMP_DIFF(Transaction_Timestamp, Third_Last_Txn, MINUTE) <= 60
GROUP BY Customer_ID