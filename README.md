# Loan Performance and Borrower Behavior Analysis

## 1. Overview

This project aims to provide insights into the business metrics of a loan portfolio. It focuses on borrower behavior, loan performance, and key financial indicators with the primary goal of identifying trends and improving decision-making for loan issuance and management.

### Key Objectives
- **Loan Repayment Analysis:** Analyze loan repayment patterns and identify factors influencing successful repayment.
- **Borrower Risk Profiling:** Categorize borrowers based on risk levels to understand the characteristics of high-risk vs. low-risk borrowers.
- **Income and Loan Trends:** Investigate how income levels and debt-to-income ratios correlate with loan amounts and statuses.
- **Interest and Revenue Insights:** Explore how interest rates impact profitability and borrower repayment behavior.

### Background
LendingClub was a prominent financial services company based in San Francisco, California. Established in 2007, it initially gained recognition as a pioneer in the peer-to-peer (P2P) lending industry. At its peak, LendingClub was the world's largest peer-to-peer lending platform. The company enabled borrowers to secure unsecured personal loans ranging from \$500 to \$35,000, with loan terms spanning three to five years. Investors could browse loan listings and select loans to fund based on borrower details, loan grades, and purposes, earning returns through interest payments. LendingClub generated revenue by charging origination fees to borrowers and service fees to investors. In 2014, LendingClub made headlines with its \$1 billion initial public offering (IPO), the largest technology IPO in the U.S. that year. However, the company faced challenges in 2016, including a scandal involving loan disclosures and a subsequent leadership change. In 2020, LendingClub shifted its business model by acquiring Radius Bank and moving away from its P2P lending platform.

This analysis uses a Lending Club dataset to unearth key factors driving loan repayment, profitability, and risk exposure. It starts with a robust descriptive analysis that will later support diagnostic and predictive analyses to enhance decision-making in loan issuance and management.

## 2. Data Structure

The dataset comes from the file `lc_loan.csv` which can be found on [Kaggle](https://www.kaggle.com/code/faressayah/lending-club-loan-defaulters-prediction/notebook?select=lc_loan.csv). It contains information on 887,379 approved loans with 47 columns, covering the period from June 2007 to December 2015. The columns include valuable details such as:
- Funded amount
- Term
- Interest rate
- Grade
- Annual income
- Debt-to-income (DTI) ratio
- Loan status
- Interest and capital recuperated

For this analysis, we focus on 23 of these characteristics.

## 3. Executive Summary

- **Total Loan Portfolio (2007-2015):**  
  Approximately \$12.5 billion across 842,000 loans, with an average of \$15,000 per loan (ranging from \$500 to \$35,000).

- **Loan Type Distribution:**  
  - Personal loans: 60%
  - Debt consolidation loans: 25%
  - Other products (e.g., educational, medical): 15%

- **Loan Statuses:**  
  - Current: 570,000 loans  
  - Fully Paid: 200,000 loans  
  - Charged Off: 45,000 loans

- **Investment Growth:**  
  The annual investment increased from \$5 million in 2007 to \$6 billion in 2015.

- **Geographical Distribution:**  
  LendingClub has a presence in all 50 states, with the highest loan counts in:  
  - California: 124,000 loans  
  - New York: 70,000 loans  
  - Texas: 68,000 loans  
  - Florida: 57,000 loans

- **Repayment Ratio:**  
  The average repayment ratio (i.e., the percentage of the initial loan that has been recuperated) is 54%.  
  - Low-risk borrowers (risk flag = 0): 57% repayment ratio  
  - High-risk borrowers (risk flag = 1): 41% repayment ratio

- **Loan Status by Risk Flag:**  
  - 71% of low-risk clients have loans that are "Current."
  - 34% of high-risk clients have loans that are "Charged Off."

- **Return on Investment (ROI) Analysis:**  
  Considering only closed loans (to avoid skewing data with current or late loans):
  - **36-month period:**  
    - 191,000 loans  
    - Capital investment: \$2.265 billion  
    - Recuperated amount: \$2.339 billion  
    - ROI: 3% (i.e., every \$100 invested returns \$3 over 3 years)
  - **60-month period:**  
    - 56,000 loans  
    - Capital investment: \$1.09 billion  
    - Recuperated amount: \$1.03 billion  
    - ROI: -5.5% (indicating a net loss)

- **Interest Rates and Borrower Segments:**  
  The average interest rate is 11.5%, ranging from 7.2% for top-rated borrowers to 25.6% for those in the lowest-rated categories. Although higher interest rates can generate increased revenue, they are also associated with elevated default risks.

## 4. Insights

- **Geographical Distribution & Portfolio Diversity:**  
  Strong loan activity in populous states like California, New York, Texas, and Florida suggests high demand and economic activity. A deeper analysis of state-specific risks and repayment rates could identify regional trends to optimize loan management strategies.

- **Risk Profiles & Repayment Behavior:**  
  Borrowers flagged as high-risk show a lower repayment ratio (41%) and are more prone to charge-offs (34%). Identifying factors that contribute to high risk can help in devising preventive measures. Meanwhile, low-risk borrowers exhibit promising repayment behavior (57% repayment ratio with 71% current status).

- **Investment Trends Over Time:**  
  The rapid growth in annual investment from \$5 million in 2007 to \$6 billion in 2015 highlights scalability, though further analysis is necessary to understand its impact on default rates and ROI.

- **Interest Rate Dynamics:**  
  While higher interest rates boost potential revenue, they bring elevated default risks. Balancing the risk-reward relationship is crucial for designing competitive loan products.

- **ROI Challenges:**  
  The negative ROI on 60-month loans (-5.5%) may point to issues in pricing or borrower evaluation for longer-term loans, necessitating adjustments in interest rate structures, segmentation methods, and repayment strategies.

**Dashboards & Tutorials:**  
- Dashboards:  
  - [Dashboard 1](https://public.tableau.com/app/profile/alex.haro1980/viz/LendingClub_17415426630890/Descriptive)  
  - [Dashboard 2](https://public.tableau.com/app/profile/alex.haro1980/viz/LendingClub2_17415435714240/Descriptive2)

- Tutorial Videos:  
  - [Tutorial (English)](https://youtu.be/FRDybmXKoK8)  
  - [Tutorial (Spanish)](https://youtu.be/8WlO3S6xvs0)

## 5. Recommendations

- **Enhance Risk Profiling:**  
  Adopt advanced machine learning models to predict borrower risk more accurately by leveraging variables such as income, credit history, and DTI ratios.

- **Adjust Long-Term Loan Policies:**  
  Reassess loan terms and interest rate structures for 60-month loans to improve profitability. Consider introducing stricter eligibility requirements or higher interest rates for high-risk borrowers opting for longer-term loans.

- **Regional Focus:**  
  Perform deeper analyses of state-specific performance metrics to tailor strategies to different geographic markets, leveraging high-performing regions while mitigating risks in lower-performing areas.

- **Portfolio Diversification Strategies:**  
  While the portfolio is diversified, a high allocation (60%) to personal loans may increase exposure to macroeconomic risks. Expanding into other loan types, such as educational or medical loans, can spread this risk further.

- **Leverage Analytics for Decision-Making:**  
  Utilize real-time dashboards for monitoring and predictive insights. Regularly sharing these insights with stakeholders can foster transparency and informed decision-making.

- **Improve Borrower Communication:**  
  Enhance financial education initiatives to encourage on-time payments, particularly targeting high-risk segments to improve overall repayment rates.

## 6. Considerations for a Second Part of the Analysis

### Diagnostic Analysis

- **Correlation & Regression Studies**
  - **Objective:** Quantify the influence of specific variables on loan repayment outcomes.
  - **Methods:** Utilize multiple regression models (e.g., logistic regression for default prediction) and correlation matrices to validate trends observed in the descriptive analysis.

- **Hypothesis Testing**
  - **Objective:** Statistically confirm the impact of factors such as income level, interest rate, and debt-to-income ratio on repayment behavior.
  - **Methods:** Perform t-tests or ANOVA to compare different borrower groups, ensuring that observed trends are statistically significant.

- **Clustering & Segmentation**
  - **Objective:** Identify distinct borrower segments based on multiple features.
  - **Methods:** Apply clustering algorithms (K-Means, Hierarchical Clustering) to refine risk profiling further.

- **Time Series Analysis**
  - **Objective:** Understand the evolution of loan performance metrics over time.
  - **Methods:** Analyze repayment frequencies and default rates on a monthly or quarterly basis.

### Predictive Analysis

- **Machine Learning Models**
  - **Objective:** Predict loan default probabilities or successful repayment chances.
  - **Methods:** Build models such as logistic regression, decision trees, random forests, or gradient boosting. Test multiple algorithms to determine the best performer.

- **Model Validation & Evaluation**
  - **Objective:** Ensure that predictive models are robust and generalize well with new data.
  - **Methods:** Employ techniques like k-fold cross-validation and evaluate using metrics such as ROC, AUC, F1 Score, and confusion matrices.

- **Feature Engineering & Importance Analysis**
  - **Objective:** Enhance model accuracy by constructing new features or refining existing ones.
  - **Methods:** Explore interaction terms, non-linear transformations, and use interpretability methods (e.g., SHAP or LIME) to understand feature importance.

- **Handling Data Imbalance**
  - **Objective:** Address cases where certain outcomes (such as defaults) are rare.
  - **Methods:** Implement techniques such as SMOTE or cost-sensitive learning to balance the model’s training process.

- **Advanced Techniques**
  - **Objective:** Expand the predictive framework beyond binary outcomes.
  - **Methods:** Consider survival analysis or time-to-event models to predict not just whether a borrower might default, but also when that might happen.
