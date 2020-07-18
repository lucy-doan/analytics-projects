# Loan Default Prediction For Credit Approval Decision


> This report attempts to analyze existing loan applicant data to predict risk type (high risk/ low risk) of forthcoming applicants using machine learning algorithms.


## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Raw data](#Raw-data)
* [Dataset description](#Dataset-description)
* [Data preparation and analysis steps](#Data-preparation-and-analysis-steps)
* [Data visualization](#Data-visualization)
* [Conclusion](#Conclusion)
* [Recommendation](#Recommendation)
* [Contact](#contact)


## General info
Bad loans, a.k.a. debts that are not recovered on time, are one of the most common causes of bank revenue losses and sometimes bankruptcy. This was one of the major drives of the financial crisis, also the US recession, in 2009 and could have been avoided if the banks had carefully chosen their borrowers.

Nowadays, many banks invest largely into risk management or credit appraisal to obtain better, scientific and data-driven input for lending decisions. This project depicts an example of how a bank can categorize borrowers into low risk or high risk of loan default.


## Technologies
### Data analytics tool: Python
### Analytics techniques:
* Problem identification: supervised learning – binary classification problem, predicting the probability of 2 output classes, low risk and high risk
* Machine learning modeling & analysis: Random forest classifier and Multi-layer perceptron (MLP) classifier


## Raw data

The data used in this project is a real-world dataset obtained from a bank in the US, containing 100,000 samples. 


## Dataset description

Variable Name | Description | Type
--- | --- | ---
Age	| Age of the borrower (in years)	Integer
Debt Ratio | The ratio of monthly debt payments to monthly gross income	| Continuous between 0 and 1
LOC	| Number of open loans and lines of credit | Integer
Income | Monthly income of the borrower	| Continuous
MREL | Number of mortgage and real estate loans | Integer
Dependents | Number of dependents of the borrower	| Integer
Utilization	| The ratio of total balance on lines of credit to the total credit limits | Continuous between 0 and 1
30Day	| Number of times the borrower has been 30-59 days past the due date in the last two years | Integer 
60Day	| Number of times the borrower has been 60-89 days past the due date in the last two years | Integer 
90Day	| Number of times the borrower has been equal to or more than 90 days past the due date | Integer 
Risk | The risk associated with the borrower	| Binary 


## Data preparation and analysis steps

### 1. Data cleaning
* Handle user input errors in column names and data types
* Handle missing values using 3 methods
####	Alternative #1: Discard incomplete rows
####	Alternative #2: Discard variable containing more than 10% missing values and substitute remaining missing values with the median of that variable
####	Alternative #3: Discard variable containing more than 10% missing values and substitute remaining missing values with the median of that variable; afterthat, oversampling to deal with imbalanced dataset

Resulting data map:

<img src="photos/data-map.jpg" width=500>

### 2. Data analysis and syntax examples

*	Calculate Average Sales Price of homes for each Zip Code
* Find 10 Zip Codes having the highest Ratio of Average Home Price to Median Household Income

<img src="photos/zipcode-highest-ratio.jpg" width=700>

* Find the customers living within 20-mile radius of the Real Estate Office

<img src="photos/within-20miles.jpg" width=700>


## Data visualization

Interactive Tableau dashboard:
https://tabsoft.co/2OCUB1G

<img src="photos/dataviz.jpg" width=800>


## Conclusion

* Market segmentation: there's a big discrepancy in consumer’s needs; Some homes price $400,000, some price less than $100,000
* Loan default risk: some areas have crazily high ratio of home price to household median income, e.g. 14.7, mainly due to too low median household income
* Sales territory: almost 80% of customers live within 20 miles from the company's office


## Recommendation

- To avoid loan default risk: by targeting the customers who are capable of buying its homes and only approve the applicants having low risks of mortgage loan default 
- To have a comprehensive market segmentation: by collecting customer’s financial health, such as credit score, individual and household incomes
- To identify key products: by collecting  KPIs of homes purchased, such as home purchase price,  gross income, operating expenses, vacancy rate


## Contact
Created by [@lucy-playing-data](https://lucyplayingdata.wordpress.com) - feel free to contact me!
