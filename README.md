# Indian Bank: Customer Behaviour Analytics

An end-to-end analytics project on 1,00,000 card transactions from an Indian bank, covering customers, cards, transactions and merchants from **January 2023 to June 2026**. It asks which customer, card, transaction and merchant characteristics drive differences in **success rates, spending and fraud**, and what the bank should do about it.

Graduation project of the **NextLeap Business Analyst Fellowship** (Top Fellow, September batch).

| Deliverable | Link |
|---|---|
| Interactive dashboards (Tableau Public, 5 dashboards in one story) | [Open the story](https://public.tableau.com/views/BA10_Graduation_Project/Story1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) |
| 15-page report with findings, recommendations and a 90-day plan | [`report/NL_Banking.pdf`](report/NL_Banking.pdf) |
| Excel analysis workbook (28 sheets, 46 charts) | [`excel/NL_Banking.xlsx`](excel/NL_Banking.xlsx) |
| Source data (4 CSVs) | [`data/`](data/) |

![Executive Overview dashboard](tableau/screenshots/01_executive_overview.png)

## Headline numbers

| Metric | Value |
|---|---|
| Transactions analysed | 1,00,000 |
| Transaction success rate | 91.15% |
| Overall fraud rate | 5.38% (5,379 cases) |
| Average transaction | Rs.16,425 (median Rs.3,148) |
| Total transaction value | Rs.164.25 Crore |

## Business problem

> Which customer, card, transaction, and merchant characteristics are associated with meaningful differences in transaction success rates, spending levels, and fraud exposure? And what specific actions should the bank take based on these behavioural patterns?

## Key findings

1. **38.09% of fraud is preventable.** 2,049 of 5,379 fraud cases come from expired (18.73%), blocked (12.97%) and lost (6.34%) card attempts, which are card-management failures that proactive alerts can address.
2. **Merchant risk level does not predict fraud.** Fraud rate is flat across Low, Medium and High risk merchants (5.38% / 5.36% / 5.40%), so the hypothesis that high-risk merchants drive fraud was **rejected**. Fraud detection should focus on card status, velocity and cross-border signals instead.
3. **International transactions underperform.** Success rate is 84.65% vs 91.50% domestic, a 6.85 pp gap driven by an 11.36% decline rate.
4. **Online Web + Debit Card is the weakest combination**, failing 9.77% of the time, on the channel with the highest average transaction value (Rs.16,929).
5. **Platinum cards spend 43.7% more per transaction than Classic** (Rs.20,546 vs Rs.14,298), which makes Gold cardholders the natural upgrade target.
6. **RuPay has the lowest fraud rate** (4.99% vs 5.54% for Visa), which is worth investigating for structural causes.
7. **Electronics, Hospital, Airline and Education** average Rs.33K to Rs.37K per transaction, more than double the dataset mean, while Hotel, Fuel and Travel lead on volume.

Seven hypotheses were tested; six were confirmed and one (merchant risk and fraud) was rejected. Full verdict table in the [report](report/NL_Banking.pdf).

![Fraud Intelligence dashboard](tableau/screenshots/04_fraud_intelligence.png)

## Recommendations (summary)

| Priority | Action | Target |
|---|---|---|
| High | Pre-travel alerts and simplified 3DS for international transactions | International success from 84.65% toward 88%+ |
| High | Card renewal reminders 60 days before expiry and real-time block notifications | Expired and blocked card fraud down 50%+ |
| High | Audit the Online Web checkout (retry logic, timeouts, error messaging) | Failure rate from 9.27% toward 8.50% |
| Medium | Platinum upgrade campaign aimed at Gold cardholders | 5% of Gold customers upgrade |
| Medium | Retrain the fraud model without merchant risk; add card status and velocity signals | False positives down 15%+ |
| Medium | EMI/cashback on high-value categories; loyalty rewards on high-frequency categories | +10% volume / +8% usage |

The report includes the full 9-point recommendation list and an owner-by-owner 90-day action plan.

## Data

Four related tables, joinable on `Customer_ID`, `Card_ID` and `Merchant_ID`. See the [data dictionary](data/README.md).

| File | Rows | Description |
|---|---|---|
| `data/customers.csv` | 25,000 | Demographics, occupation, income, segment, account type |
| `data/cards.csv` | 32,457 | Card type, network, credit limit, status, issue/expiry dates |
| `data/transactions.csv` | 1,00,000 | Amount, channel, payment method, status, international and fraud flags |
| `data/merchants.csv` | 500 | Category, location, risk level, rating |

### Data quality notes

- Fraud_Reason is empty for all 94,621 non-fraud transactions, which is expected.
- 2,539 customers have the typo "Divorsed" in `Marital_Status`; treated as "Divorced" in the analysis.
- Transactions after June 2026 are partial months and were excluded from trend analysis.
- Tableau Public silently dropped 73 transaction rows during extract compression. This was caught during reconciliation and fixed by regenerating a clean UTF-8 CSV.
- KPI cards use FIXED LOD calculations so metrics such as average transaction amount do not drift when filters change.

## Approach

1. **Excel workbook:** problem statement, data quality checks, EDA, customer / card / transaction / fraud / spending / merchant / trend analysis, and insights and recommendations, plus raw and master lookup sheets.
2. **Tableau Public:** five dashboards published as one story: Executive Overview, Customer Behaviour, Channel and Transaction Analysis, Fraud Intelligence, Merchant and Spending Analysis.
3. **PDF report:** executive summary, hypothesis validation, findings, recommendations and a 90-day action plan, with charts built in Python (matplotlib).

## Tools

Excel · Tableau Public · Python (pandas, matplotlib)

## Repository structure

```
├── data/        customers.csv, cards.csv, transactions.csv, merchants.csv + data dictionary
├── excel/       NL_Banking.xlsx
├── report/      NL_Banking.pdf
└── tableau/     dashboard screenshots
```

## About me

**Shubham Meena**: operations professional (petroleum industry) moving into data analytics.  
LinkedIn: _add your URL_ · Email: _add your email_
