Project Title: Banking Fraud Detection Pipeline (Velocity & Structuring)

1. Business Objective: To identify anomalous transaction patterns that indicate stolen credentials or attempts to bypass regulatory reporting thresholds.

2. Detection Logic (The "Why"):

Velocity Check: Identifies "spending spikes." A transaction is flagged if it exceeds 500% of the customer's moving average over their last 10 transactions. This catches "Loud Fraud" where account takeover results in immediate high-value draining.

Structuring Check (Threshold): Identifies "Quiet Fraud." Flagged when 3 or more transactions of identical amounts occur within a 60-minute window. This detects attempts to stay under the R1,000 internal reporting limit.

3. Technical Stack: Google BigQuery (SQL), Window Functions (AVG OVER, LAG), Common Table Expressions (CTEs), and Temporal Analysis (TIMESTAMP_DIFF).