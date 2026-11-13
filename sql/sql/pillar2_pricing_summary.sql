CREATE TABLE pillar2_pricing_summary AS
               SELECT
                   CASE
                       WHEN price = 0 THEN '1. Free'
                       WHEN price > 0 AND price <= 10 THEN '2. Budget ($0.01 - $10)'
                       WHEN price > 10 AND price <= 30 THEN '3. Mid-Tier ($10.01 - $30)'
                       ELSE '4. AAA ($30+)'
                   END AS pricing_tier,
                   ROUND(AVG(median_playtime), 2) AS avg_med_playtime,
                   COUNT(appid) AS game_count,
                   SUM(positive_ratings) AS total_positive_reviews,
                   SUM(negative_ratings) AS total_negative_reviews,
                   ROUND(100 * SUM(positive_ratings) / NULLIF(SUM(positive_ratings) + SUM(negative_ratings), 0), 2) AS positive_satisfaction_pct
               FROM games
               GROUP BY pricing_tier
               ORDER BY pricing_tier;
               
COPY (
                   SELECT
                       CASE
                           WHEN price = 0 THEN '1. Free'
                           WHEN price > 0 AND price <= 10 THEN '2. Budget ($0.01 - $10)'
                           WHEN price > 10 AND price <= 30 THEN '3. Mid-Tier ($10.01 - $30)'
                           ELSE '4. AAA ($30+)'
                       END AS pricing_tier,
                       ROUND(AVG(median_playtime), 2) AS avg_med_playtime,
                       COUNT(appid) AS game_count,
                       SUM(positive_ratings) AS total_positive_reviews,
                       SUM(negative_ratings) AS total_negative_reviews,
                       ROUND(100 * SUM(positive_ratings) / NULLIF(SUM(positive_ratings) + SUM(negative_ratings), 0), 2) AS positive_satisfaction_pct
                   FROM games
                   GROUP BY pricing_tier
                   ORDER BY pricing_tier
               ) TO 'pillar2_pricing_summary.csv' (HEADER, DELIMITER ',');
SELECT appid, genres, steamspy_tags
               FROM games
               LIMIT 10;