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

* 1st dataset: SacRealEstate, containing 986 records of the past transactions conducted in 2008, with information about house address (street, city, zip, geographic location), house information (number of beds, number of baths, square feet, type) and transaction details (sales date, price). 
* 2nd dataset: HHIncome, containing median and mean household income of 32,634 zip codes in the US during the 2006-2010 period. 


## Dataset description
<img src="photos/dataset_description.jpg" width=600>


## Data preparation and analysis steps

### 1. Data preparation
* Load 2 datasets into SQL Server using SQL Server Import and Export Wizard
* Convert data type, handling data errors and creating new calculated columns
* Design data schema
<img src="photos/design-data-schema.jpg" width=700>

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
