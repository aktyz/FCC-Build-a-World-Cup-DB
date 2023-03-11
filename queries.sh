#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) AS total FROM games;")"
echo

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games;")"
echo

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),2) FROM games;")"
echo

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games;")"
echo

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(GREATEST(winner_goals, opponent_goals)) FROM games;")"
echo

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT DISTINCT COUNT(*) OVER() AS total FROM games GROUP BY game_id HAVING winner_goals > 2;")"
echo

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM games FULL JOIN teams ON games.winner_id = teams.team_id WHERE year=2018 AND round='Final';")"
echo

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT name FROM games AS g LEFT JOIN teams AS t ON g.opponent_id=t.team_id WHERE g.year=2014 AND g.round='Eighth-Final' UNION SELECT name FROM games AS g LEFT JOIN teams AS t ON g.winner_id=t.team_id WHERE g.year=2014 AND g.round='Eighth-Final';")"
echo

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT t.name FROM games AS g LEFT JOIN teams AS t ON g.winner_id=t.team_id ORDER BY t.name;")"
echo

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT g.year,t.name FROM games AS g LEFT JOIN teams AS t ON g.winner_id=t.team_id WHERE g.round='Final' ORDER BY g.year;")"
echo

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%';")"
echo
