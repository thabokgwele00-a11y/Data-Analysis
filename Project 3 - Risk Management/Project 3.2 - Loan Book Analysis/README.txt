README: Project 3.2 — Credit Risk & Loan Provisioning
1. Business Objective: To measure the bank's credit risk exposure and calculate mandatory capital reserves (provisions) based on IFRS 9 staging principles.

2. Transformation Logic:

Temporal Analysis: Calculated Days Past Due (DPD) using DATE_DIFF between current date and payment deadlines.

Risk Staging: Segmented the loan book into Arrears Buckets (Current, 1-30, 31-90, 90+ days).

Expected Credit Loss (ECL): Applied weighted impairment percentages to each bucket (2%, 15%, 50%) to calculate the total financial reserve required to cover potential defaults.

3. Technical Stack: Google BigQuery (SQL), Date/Time Functions, CTE Sequencing, Advanced Aggregations.