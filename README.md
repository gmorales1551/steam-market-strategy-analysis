# Steam Market Strategy & Risk Analysis: A Data-Driven Approach to Game Development & Publishing

An executive-ready, 2x2 Tableau dashboard analyzing Steam catalog data to evaluate market supply vs. demand, micro-category saturation, pricing tier value efficiency, and financial risk dead zones. 

---

## 📊 Executive Summary
The video game marketplace on Steam is heavily saturated, making traditional intuition-based development risky. This project analyzes catalog metrics, pricing distributions, user reviews, and playtime data to answer a core business question for studio leadership and market analysts: **Where is the genuine consumer demand, and where do developers get trapped in low-satisfaction product failures?**

---

## 🏗️ The 4-Pillar Analytical Framework

The dashboard is structured into a 2x2 grid, separating high-level market landscape assessment from deep-dive monetization and risk economics:

1. **Supply vs. Demand (Top-Left):** 
   - *Metrics:* Bar lengths driven by **Positive Demand**; color gradient encodes **Game Count Density**.
   - *Key Takeaway:* While multi-genre indie hybrids dominate release volume, standalone **Action** titles capture an outlier volume of positive consumer demand in a league of their own.
2. **Micro-Category Saturation & Satisfaction (Top-Right):**
   - *Metrics:* Bar lengths show **Game Count**; color gradient encodes **Tag Satisfaction Pct**.
   - *Key Takeaway:* Maps out micro-tag saturation levels, allowing stakeholders to identify which crowded categories maintain high consumer delight versus those that suffer from saturation fatigue.
3. **Value Efficiency (Bottom-Left):**
   - *Metrics:* Bar lengths organized by **Avg Median Playtime** across pricing tiers; color gradient encodes satisfaction percentage.
   - *Key Takeaway:* Highlights the monetization paradox—Free and Budget tiers ($0.01–$10) drive raw volume, but AAA titles ($30+) command the highest long-term playtime investment despite carrying lower overall satisfaction ratings.
4. **Risk / Dead Zones (Bottom-Right):**
   - *Metrics:* Bar lengths quantify **Total Trapped Owners** (players stuck in games with 20+ reviews but <50% positive satisfaction).
   - *Key Takeaway:* Proves that while budget tiers drive acquisition, they also absorb the vast majority of consumer failure volume, while AAA pricing tiers insulate capital and feature the lowest volume of trapped players.

---

## 🛠️ Data Engineering & Troubleshooting Highlight
* **Data Cleansing:** Standardized pricing tier naming conventions, stripped redundant numbering from category labels for professional presentation, and re-aligned axis scaling to accurately reflect multi-million user populations.
* **Iterative Query Correction (Pillar 4):** Documented and resolved initial filtering logic errors in the risk calculation script (`pillar4_risk_summaryv1.csv` vs. the finalized correct version) to ensure "failing" games with high review thresholds were accurately isolated without inflating false positives.

---

## 📂 Repository Structure
```text
├── Steam_Market_Strategy_Analysis.twbx       # Packaged Tableau workbook with embedded data sources
├── data/
│   ├── pillar1_genre_summary.csv             # Genre volume and positive demand metrics
│   ├── pillar2_pricing_summary.csv           # Pricing tier monetization and playtime stats
│   ├── pillar3_tag_summary.csv               # Micro-category tags, saturation, and satisfaction
│   └── pillar4_risk_summary_v2_final.csv     # Cleaned risk data isolating "Trapped Owners"
└── README.md                                 # Project documentation
