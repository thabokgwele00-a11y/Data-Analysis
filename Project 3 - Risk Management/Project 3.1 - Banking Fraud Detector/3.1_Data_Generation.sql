CREATE OR REPLACE TABLE `Fraud_Detection.Fact_Transactions` AS
WITH base_data AS (
  SELECT
    1000 + row_num AS Transaction_ID,
    MOD(row_num, 100) + 1 AS Customer_ID, -- 100 Unique Customers
    TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL CAST(row_num AS INT64) MINUTE) AS Transaction_Timestamp,
    ROUND(RAND() * 500 + 10, 2) AS Amount,
    CASE 
      WHEN MOD(row_num, 5) = 0 THEN 'Groceries'
      WHEN MOD(row_num, 5) = 1 THEN 'Fuel'
      WHEN MOD(row_num, 5) = 2 THEN 'Dining'
      WHEN MOD(row_num, 5) = 3 THEN 'Pharmacy'
      ELSE 'Online Shopping'
    END AS Category
  FROM UNNEST(GENERATE_ARRAY(1, 5000)) AS row_num
),
fraud_injections AS (
  -- Planting "Velocity Fraud": Customer 42 suddenly spends big amounts in seconds
  SELECT 9999 AS Transaction_ID, 42 AS Customer_ID, CURRENT_TIMESTAMP() AS Transaction_Timestamp, 15000.00 AS Amount, 'Electronics' AS Category UNION ALL
  SELECT 9998, 42, TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 SECOND), 12000.00, 'Online Gambling' UNION ALL
  SELECT 9997, 42, TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 2 SECOND), 18000.00, 'Crypto Exchange' UNION ALL
  -- Planting "Threshold Fraud": Customer 7 spends exactly 999.99 multiple times (trying to stay under 1000 limit)
  SELECT 9996, 7, TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 10 MINUTE), 999.99, 'Retail' UNION ALL
  SELECT 9995, 7, TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 11 MINUTE), 999.99, 'Retail' UNION ALL
  SELECT 9994, 7, TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 12 MINUTE), 999.99, 'Retail'
)
SELECT * FROM base_data
UNION ALL
SELECT * FROM fraud_injections;