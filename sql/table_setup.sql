-- Create and review initial games table
CREATE TABLE games AS
         SELECT * FROM read_csv('C:\Users\gmora\Desktop\Career\Portfolio\Steam Demographic Growth Strategy Dashboard\Dataset\Uncleaned\games\archive\steam.csv',
         header = true);

SELECT * FROM games LIMIT 5;

-- Create and review initial game tags table
CREATE TABLE game_tag AS
         SELECT * FROM read_csv('C:\Users\gmora\Desktop\Career\Portfolio\Steam Demographic Growth Strategy Dashboard\Dataset\Uncleaned\games\archive\steamspy_tag_data.csv',
         header = true);

SELECT * FROM game_tag LIMIT 5;