CREATE OR REPLACE TABLE `SARB_Reporting.Fact_Balances` AS
SELECT
  100000 + row_num AS Account_Number,
  -- Generate a random balance between R5,000 and R1,000,000
  ROUND(RAND() * 995000 + 5000, 2) AS Current_Balance,
  -- Assign an Account Type code
  CASE 
    WHEN MOD(row_num, 4) = 0 THEN 'SA01' -- Savings
    WHEN MOD(row_num, 4) = 1 THEN 'CH01' -- Cheque
    WHEN MOD(row_num, 4) = 2 THEN 'TD01' -- Term Deposit
    ELSE 'OD01' -- Overdraft
  END AS Product_Code
FROM (
  SELECT row_num 
  FROM UNNEST(GENERATE_ARRAY(1, 1000)) AS row_num
)