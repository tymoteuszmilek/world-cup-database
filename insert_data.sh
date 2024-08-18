#! /bin/bash

# Determine which database to use based on the argument
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Delete all the data from the tables
$PSQL "TRUNCATE teams, games;"

# Read through the file line by line
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Skip empty lines or lines that do not contain enough fields
  if [[ -z $YEAR || -z $ROUND || -z $WINNER || -z $OPPONENT || -z $WINNER_GOALS || -z $OPPONENT_GOALS || $YEAR == 'year' ]]; then
    continue
  fi

  # Trim any leading or trailing whitespace
  YEAR=$(echo $YEAR | xargs)
  ROUND=$(echo $ROUND | xargs)
  WINNER=$(echo $WINNER | xargs)
  OPPONENT=$(echo $OPPONENT | xargs)
  WINNER_GOALS=$(echo $WINNER_GOALS | xargs)
  OPPONENT_GOALS=$(echo $OPPONENT_GOALS | xargs)

  # Escape single quotes in team names
  WINNER=$(echo $WINNER | sed "s/'/''/g")
  OPPONENT=$(echo $OPPONENT | sed "s/'/''/g")

  # Get Winner ID
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")

  # If Winner Team not in table yet, insert it and get the new team_id
  if [[ -z $WINNER_ID ]]; then
    RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') RETURNING team_id;")
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
  fi

  # Get Opponent ID
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")

  # If Opponent Team not in table yet, insert it and get the new team_id
  if [[ -z $OPPONENT_ID ]]; then
    RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
  fi

  # Insert the game record into the games table
  RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")

  # Optionally, check if the insertion was successful
  if [[ $? -ne 0 ]]; then
    echo "Error inserting game record: $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS"
  fi


done
