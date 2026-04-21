CREATE OR REPLACE TABLE `SARB_Reporting.Dim_Customers` AS
SELECT
  -- Create a unique Account Number
  100000 + row_num AS Account_Number,
  -- Randomly assign Customer Category for BA 900 reporting
  CASE 
    WHEN row_num <= 500 THEN 'Private Household'
    WHEN row_num <= 800 THEN 'Corporate'
    ELSE 'Institutional Investor'
  END AS Sector_Category,
  -- Assign Province (reuse your previous logic)
  CASE
    WHEN MOD(row_num, 3) = 0 THEN 'Gauteng'
    WHEN MOD(row_num, 3) = 1 THEN 'Western Cape'
    ELSE 'KwaZulu-Natal'
  END AS Province
FROM (
  SELECT row_num 
  FROM UNNEST(GENERATE_ARRAY(1, 1000)) AS row_num
)