# ⛏️ Indian Coal Market Analysis (2010–2015)

An end-to-end data analytics project analyzing India's state-wise coal production volume and fiscal value using **Python, SQL (MySQL), and Google Sheets / Power BI**.

---

## 📌 Objective
To analyze India's coal mining market across 5 fiscal years (FY 2010–11 to FY 2014–15) to evaluate production concentration, identify growth trajectories across mineral corridors, analyze geopolitical impacts (state reorganizations), and uncover strategic supply trends.

---

## 🛠️ Tools & Architecture

* **Python (Pandas):** Programmatic unpivoting (`pd.melt`), string normalization, data type casting, and anomaly handling.
* **SQL (MySQL):** Relational storage, window functions (`LAG`, `DENSE_RANK`), Year-over-Year growth analysis, and market share CTEs.
* **Google Sheets / Power BI:** Aggregated pivot models, KPI scorecards, and executive stacked bar visualizations.

```text
[Raw Dataset: production.csv]
       │
       ▼
[Python / Pandas] ──────── Clean & Unpivot Once (pd.melt, strip '*', handle 'NA')
       │
       ▼
[SQL Database (MySQL)] ── Central Storage & Analytical Logic (Rankings, YoY Growth)
       │
       ▼
[Google Sheets / BI] ──── Executive Stacked Bar Visuals & KPI Cards
```
