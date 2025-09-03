Fashion Catalog SQL Analysis

This project analyzes the product catalog of a European fashion e-commerce retailer using SQLite and DB Browser for SQLite.

 Dataset
- Source: [European Fashion E-commerce Dataset on Kaggle](https://www.kaggle.com/)  
- Not included here due to size and licensing.  
- This repo focuses on the SQL queries and CSV outputs only.  

Analysis
1. Category counts – Number of SKUs by category.
2. Catalog vs cost price by category – Average price, cost, and absolute margin.
3. Gender distribution – Breakdown of SKUs by gender.
4. Top brands – Most common brands in the catalog.
5. Price bands – Distribution of products across price ranges.
6. Margin rates – Average margin % by category.

## Files
- `queries.sql` → all SQL queries used in this analysis
- `outputs/` → exported CSV results:
  - catalog_category_counts.csv
  - catalog_price_vs_cost_by_category.csv
  - catalog_gender_split.csv
  - top_brands_by_count.csv
  - catalog_price_bands.csv
  - catalog_margin_rate_by_category.csv

Key Insights (sample – replace with your findings)
- Tops and Dresses are the largest categories in the catalog.
- Accessories have higher average margins compared to Footwear.
- The majority of SKUs are priced between **20–40**.
- Top 5 brands account for a significant share of the product range.

👨‍💻 Built with:  
- SQLite (via DB Browser for SQLite)  
- Kaggle dataset (product catalog)  
- CSV outputs for easy sharing and reproducibility
