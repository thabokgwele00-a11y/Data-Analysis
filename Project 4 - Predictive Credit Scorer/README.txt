README: Project 4 — Predictive Credit Scoring (Machine Learning)
1. Business Objective: To transition from reactive "Arrears Analysis" to proactive "Default Prediction." By using historical data, the bank can automatically approve or deny loans based on a calculated probability of default.

2. The Model Logic:

Algorithm: Logistic Regression (Binary Classification).

Features: Monthly Income, Debt-to-Income Ratio, Years Employed, and Prior Default History.

The "Unmasking" Process: Used SQL Array Unnesting to extract specific probability scores from the model's nested output.

3. Results: The model provides a "Probability of Default" for every new applicant, allowing for a threshold-based approval system (e.g., rejecting any applicant with a >70% risk score).

4. Technical Stack: BigQuery ML (BQML), Logistic Regression, Array Unnesting, CTEs.