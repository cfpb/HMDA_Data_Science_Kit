# Using Modified LAR Data
Modified LAR is the public-facing set of the Loan Application Register data 
containing fields that are altered or removed for privacy reasons.
Please refer to the [schemas](https://github.com/cfpb/HMDA_Data_Science_Kit/tree/master/documentation_resources/schemas/mlar/schemas/), or [Regulation C](https://www.consumerfinance.gov/policy-compliance/rulemaking/regulations/1003/) for further details on Modified LAR disclosure. 

### Fields Removed in the 2018 Modified LAR Data Release for Privacy 
1. Universal Loan Identifier (ULI) or Non Universal Loan Identifier (NULI)
2. Application Date
3. Action Taken Date
4. Street Address 
5. City
6. Zip Code
7. Ethnicity of Applicant or Borrower: Free Form Text Field for Other 
Hispanic or Latino
8. Ethnicity of Co-Applicant or Co-Borrower: Free Form Text Field for Other 
Hispanic or Latino
9. Race of Applicant or Borrower: Free Form Text Field for American Indian 
or Alaska Native Enrolled or Principal Tribe
10. Race of Applicant or Borrower: Free Form Text Field for Other Asian
11. Race of Applicant or Borrower: Free Form Text Field for Other Pacific 
Islander
12. Race of Co-Applicant or Co-Borrower: Free Form Text Field for American 
Indian or Alaska Native Enrolled or Principal Tribe
13. Race of Co-Applicant or Co-Borrower: Free Form Text Field for Other Asian
14. Race of Co-Applicant or Co-Borrower: Free Form Text Field for Other 
Pacific Islander
15. Credit Score of Applicant or Borrower.
16. Credit Score of Co-Applicant or Co-Borrower
17. Applicant or Borrower, Name and Version of Credit Scoring Model: 
Conditional Free Form Text Field for Code 8
18. Co-Applicant or Co-Borrower, Name and Version of Credit Scoring Model: 
Conditional Free Form Text Field for Code 8
19. Reason for Denial: Conditional Free Form Text Field for Code 9
20. Mortgage Loan Originator NMLSR Identifier
21. Automated Underwriting System: Conditional Free Form Text Field for Code 5
22. Automated Underwriting System Result: 1
23. Automated Underwriting System Result: 2
24. Automated Underwriting System Result: 3
25. Automated Underwriting System Result: 4
26. Automated Underwriting System Result: 5
27. Automated Underwriting System Result: Conditional Free Form Text Field for 
Code 16

### New Fields Added to Modified LAR
Age of Applicant >= 62
Description: Field that indicates whether the applicant or borrower has an
age greater than or equal to 62. 
1. 'Yes'if the age of the applicant is >= 62. 
2. 'No' if the age is <= 62. 
3. 'NA'if Age of Applicant or Borrower is 8888 or 9999

Age of Co-Applicant >= 62
Description: Field that indicates whether the applicant or borrower has an
age greater than or equal to 62. 
1. 'Yes'if the age of the applicant is >= 62. 
2. 'No' if the age is <= 62. 
3. 'NA'if Age of Applicant or Borrower is 8888 or 9999

Age of Co-Applicant >= 62

### Fields Modified for Privacy in the Modified LAR Data

Along with omitted fields, the modified LAR data contains the following 
alterations to reported values. 

Loan Amount 
Description: Each loan amount is listed as the midpoint into which the 
reported value falls (For example a reported value of $117834 would be 
disclosed $115000 as the midpoint between values = $110000 and < $120000). 

Applicant/Co-Applicant Age 
Description: Each age value is binned to the following categories:
1. Ages less than 25 - '<25'
2. Ages between 25 and 34 - '25-34' 
3. Ages between 35 and 44 - '35-44' 
4. Ages between 45 and 54 - '45-54'
5. Ages between 55 and 64 - '55-64'
6. Ages between 65 and 74 - '65-74'
7. Ages greater than 74 - '>74'

Debt-to-Income Ratio
Description: Exact values between 36% and less than 50% are disclosed as-is. 
Non-applicable values are disclosed as-is. Exempt values are disclosed as-is. 
All other categories are binned to the following:

1. Values less than 20% - '<20%'
2. Values between 20% and less than 30% - '20%-<30%'
3. Values between 30% and less than 36% - '30%-<36%'
4. Values between 50% and 60% - '50%-60%' 
5. Values greater than 60%. - '>60%'

Property Value 
Description: Each property value is listed as the midpoint into which the 
reported value falls (For example a reported value of $117834 would be 
disclosed as $115000 as the midpoint between values $110000 and $120000.

Total Units
Description: Exact values between 1 and 4 are disclosed. Other values are 
binned according to the following: 
1. Values between 5 and 24 - '5-24'
2. Values between 25 and 49 - '25-49' 
3. Values between 50 and 99 - '50-99'
4. Values between 100 and 149 - '100-149'
5. Values over 149 - '>149'

Multifamily Affordable Units
Description: Values that are not NA or Exempt are disclosed as a percentage 
calculated as multifamily affordable units reported / total units reported. 
 
 
