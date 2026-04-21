Project 2: SARB BA 900 Regulatory Reporting Pipeline
1. Business Objective: To automate the "Sectoral Distribution of Deposits" section of the BA 900 monthly return required by the South African Reserve Bank (SARB). This ensures accurate reporting of the bank's liquidity and funding stability.

2. Transformation Logic:

Relational Mapping: Performed a Three-Way Join between Dim_Customers, Fact_Balances, and Dim_Product_Mapping to connect account balances to regulatory sectors and product types.

Weighted Liquidity (Haircut): Used a Common Table Expression (CTE) to calculate "Weighted Liquidity" based on Basel III principles:

Liquid Assets (Cheque/Savings) = 100% weight.

Stable Funding (Term Deposits) = 50% weight.

Credit/Assets (Overdrafts) = 0% weight for deposit reporting.

3. Technical Stack: Google BigQuery (SQL), Relational Data Modeling, CTEs, Multi-table Joins