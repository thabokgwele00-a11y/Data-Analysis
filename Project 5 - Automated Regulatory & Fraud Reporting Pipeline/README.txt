Project Title: Automated Regulatory & Fraud Reporting Pipeline

1. Business Objective: To bridge the gap between database analysis and executive action. This project automates the extraction of "high-risk" flags and delivers them in a portable format (CSV) for non-technical stakeholders (Risk Managers, Legal Counsel).

2. Transformation Logic:

Orchestration: Used Python to authenticate with Google Cloud APIs and execute complex SQL logic remotely.

Data Handling: Leveraged the Pandas library to transform raw BigQuery result sets into structured DataFrames.

Automation: Developed a script that can be scheduled to run "headless" (without manual intervention), ensuring daily oversight of transaction velocity.

3. Technical Stack: Python (Google Cloud Client Library), Pandas, BigQuery, Google Colab, API Authentication.