CREATE OR REPLACE TABLE `Credit_Risk.Fact_Loans` AS
SELECT
  1000 + row_num AS Loan_ID,
  MOD(row_num, 100) + 1 AS Customer_ID,
  -- Loan amounts from R10,000 to R500,000
  ROUND(RAND() * 490000 + 10000, 2) AS Principal_Amount,
  -- Interest rates from 7% to 22% (typical SA rates)
  ROUND(RAND() * 0.15 + 0.07, 4) AS Annual_Interest_Rate,
  -- Randomly set the "Last Payment Date"
  -- Some are recent, some are months ago
  DATE_SUB(CURRENT_DATE(), INTERVAL CAST(FLOOR(RAND() * 120) AS INT64) DAY) AS Last_Payment_Date,
  -- Next payment was due 30 days after last payment
  DATE_SUB(CURRENT_DATE(), INTERVAL CAST(FLOOR(RAND() * 60) AS INT64) - 15 DAY) AS Payment_Due_Date
FROM UNNEST(GENERATE_ARRAY(1, 1000)) AS row_num;