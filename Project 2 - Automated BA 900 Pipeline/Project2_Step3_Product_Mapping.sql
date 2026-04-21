CREATE OR REPLACE TABLE `SARB_Reporting.Dim_Product_Mapping` AS
SELECT 'SA01' AS Product_Code, 'Savings Account' AS Product_Name, 'Liquid' AS Liquidity_Status UNION ALL
SELECT 'CH01', 'Cheque Account', 'Liquid' UNION ALL
SELECT 'TD01', 'Term Deposit', 'Fixed' UNION ALL
SELECT 'OD01', 'Overdraft', 'Credit'