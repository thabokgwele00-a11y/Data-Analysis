WITH CTE_First AS (
  SELECT b.Current_Balance, m.Liquidity_Status, c.Sector_Category,
  CASE
    WHEN m.Liquidity_Status = 'Liquid' THEN b.Current_Balance
    WHEN m.Liquidity_Status = 'Fixed' THEN (b.Current_Balance * 0.5)
    ELSE 0
    END AS Weighted_Liquidity
  FROM `SARB_Reporting.Fact_Balances` b JOIN `SARB_Reporting.Dim_Product_Mapping` m ON b.Product_Code = m.Product_Code
  JOIN `SARB_Reporting.Dim_Customers` c ON c.Account_Number = b.Account_Number
)
SELECT
  Sector_Category, SUM(Weighted_Liquidity) AS Total_Weighted_Liquidity
FROM
  CTE_First
GROUP BY
  Sector_Category