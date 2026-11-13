CREATE TABLE pillar4_risk_summary AS
CREATE OR REPLACE TABLE pillar4_risk_summary AS
               SELECT
                   CASE
                       WHEN price = 0 THEN '1. Free'
                       WHEN price > 0 AND price <= 10 THEN '2. Budget ($0.01 - $10)'
                       WHEN price > 10 AND price <= 30 THEN '3. Mid-Tier ($10.01 - $30)'
                       ELSE '4. AAA ($30+)'
                   END AS pricing_tier,
                   COUNT(appid) AS failed_game_count,
                   SUM(CAST(REPLACE(SPLIT_PART(owners, '-', 1), ',', '') AS BIGINT)) AS total_trapped_owners,
                   ROUND(AVG(positive_ratings), 1) AS avg_positive_reviews,
                   ROUND(AVG(negative_ratings), 1) AS avg_negative_reviews,
                   ROUND(100.0 * SUM(positive_ratings) / NULLIF(SUM(positive_ratings) + SUM(negative_ratings), 0), 2) AS overall_tier_satisfaction_pct
               FROM games
               WHERE (positive_ratings + negative_ratings) >= 20
                 AND (100.0 * positive_ratings / (positive_ratings + negative_ratings)) < 50.0
               GROUP BY pricing_tier
               ORDER BY total_trapped_owners DESC;

COPY pillar4_risk_summary TO 'pillar4_risk_summary.csv' (HEADER, DELIMITER ',');