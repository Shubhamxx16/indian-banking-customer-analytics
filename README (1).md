# Data dictionary

All files are UTF-8 CSV. Dates in `customers.csv` and `cards.csv` are DD-MM-YYYY; dates in `transactions.csv` and `merchants.csv` are YYYY-MM-DD.

## customers.csv (25,000 rows)
`Customer_ID`, `Customer_Name`, `Gender`, `Age`, `Marital_Status`, `Occupation`, `Annual_Income`, `Customer_Segment` (Platinum / Gold / Standard / Basic), `State`, `City`, `Account_Type` (Savings / Salary / Student / Current), `Customer_Since`

## cards.csv (32,457 rows)
`Card_ID`, `Customer_ID`, `Card_Type` (Platinum / Gold / Silver / Classic), `Card_Network` (Visa / Mastercard / RuPay / Amex), `Credit_Limit`, `Card_Status` (Active / Expired / Blocked / Lost), `Contactless`, `Card_Mode`, `Issue_Date`, `Expiry_Date`

## transactions.csv (1,00,000 rows)
`Transaction_ID`, `Customer_ID`, `Card_ID`, `Merchant_ID`, `Transaction_Date`, `Transaction_Time`, `Transaction_Amount`, `Payment_Method`, `Transaction_Channel` (POS / Mobile App / ATM / Online Web), `Device_Type`, `Transaction_Status` (Successful / Declined / Failed), `Is_International` (1 = international), `Fraud_Flag` (1 = fraud), `Fraud_Reason` (blank when not fraud), `Merchant_Risk_Level`, `Merchant_Category`, `Customer_State`, `Customer_City`, `Merchant_State`, `Merchant_City`

## merchants.csv (500 rows)
`Merchant_ID`, `Merchant_Name`, `Merchant_Category`, `State`, `City`, `Merchant_Risk_Level` (Low / Medium / High), `Merchant_Rating`, `Merchant_Status`, `Merchant_Since`

## Relationships
`transactions.Customer_ID → customers.Customer_ID` · `transactions.Card_ID → cards.Card_ID` · `transactions.Merchant_ID → merchants.Merchant_ID` · `cards.Customer_ID → customers.Customer_ID`
