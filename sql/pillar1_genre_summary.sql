CREATE TABLE pillar1_genre_summary AS SELECT
                   COUNT(appid) AS game_count,
                   genres,
                   SUM(positive_ratings) AS positive_demand,
                   SUM(CAST(REPLACE(SPLIT_PART(owners, '-', 1), ',', '') AS BIGINT)) AS total_estimated_lower_bound_owners,
                   ROUND(AVG(price), 2) AS avg_genre_price,
               FROM games
               GROUP BY genres
               ORDER BY positive_demand DESC;
               
COPY (
                   SELECT
                       COUNT(appid) AS game_count,
                       genres,
                       SUM(positive_ratings) AS positive_demand,
                       SUM(CAST(REPLACE(SPLIT_PART(owners, '-', 1), ',', '') AS BIGINT)) AS total_estimated_lower_bound_owners,
                       ROUND(AVG(price), 2) AS avg_genre_price
                   FROM games
                   WHERE (length(genres) - length(replace(genres, ';', '')) + 1) <= 4
                   GROUP BY genres
                   ORDER BY game_count DESC
               ) TO 'pillar1_genre_summary.csv' (HEADER, DELIMITER ',');