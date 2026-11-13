CREATE TABLE pillar3_tag_summary AS
               SELECT
                   TRIM(unnest(string_split(steamspy_tags, ';'))) AS single_tag,
                   COUNT(appid) AS game_count,
                   SUM(positive_ratings) AS total_positive_reviews,
                   SUM(negative_ratings) AS total_negative_reviews,
                   ROUND(100.0 * SUM(positive_ratings) / NULLIF(SUM(positive_ratings) + SUM(negative_ratings), 0), 2) AS tag_satisfaction_pct
               FROM games
               WHERE steamspy_tags IS NOT NULL
               GROUP BY single_tag
               HAVING COUNT(appid) > 1000
               ORDER BY game_count DESC;
COPY (
                   SELECT
                       TRIM(unnest(string_split(steamspy_tags, ';'))) AS single_tag,
                       COUNT(appid) AS game_count,
                       SUM(positive_ratings) AS total_positive_reviews,
                       SUM(negative_ratings) AS total_negative_reviews,
                       ROUND(100.0 * SUM(positive_ratings) / NULLIF(SUM(positive_ratings) + SUM(negative_ratings), 0), 2) AS tag_satisfaction_pct
                   FROM games
                   WHERE steamspy_tags IS NOT NULL
                   GROUP BY single_tag
                   HAVING COUNT(appid) > 1000
                   ORDER BY game_count DESC
               ) TO 'pillar3_tag_summary.csv' (HEADER, DELIMITER ',');