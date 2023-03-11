#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams;")

cat games.csv | while IFS="," read YEAR ROUND WINNER_NAME OPPONENT_NAME WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    #get WINNER_ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_NAME';")
    #if not found
    if [[ -z $WINNER_ID ]]
    then
      #insert WINNER_NAME
      INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER_NAME');")
      if [[ $INSERT_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $WINNER_NAME
      fi
      #get new WINNER_ID
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_NAME';")
    fi

    #get OPPONENT_ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_NAME';")
    #if not found
    if [[ -z $OPPONENT_ID ]]
    then
      #insert OPPONENT_NAME
      INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT_NAME');")
      if [[ $INSERT_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $OPPONENT_NAME
      fi
    #get new OPPONENT_ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_NAME';")
    fi

    #insert into games
    INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id,winner_goals, opponent_goals)
    VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
    if [[ $INSERT_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into games, $YEAR, $ROUND, $WINNER_NAME, $OPPONENT_NAME, $WINNER_GOALS, $OPPONENT_GOALS
    fi
  fi
done
