 MLB Stats Lookup
 
The MLB stats lookup uses an API (Application Programming Interface) to retrieve data about teams and players. The application retrieves the information from the   API and stores it in a local database. You can use this to look up specific statistics or to compare player and team information.
 
 Prerequisites: 
 This application is using Ruby v.2.6.1
 This application is using the following Gemfiles:
 "sinatra-activerecord"
 "sqlite3"
 "require_all"
 "rake"
 "pry"
 
 Installation:
 1. git clone https://github.com/Drothschild89/Riley-Dustin-Project.git
 2. In console type: bundle install
 3. In console type: rake db:migrate
 4. To test methods type: rake console
 
 How To Use:
  Player Class - 
   Player.player_info("Player name here") to retrieve a player's name, position, and birth country
   Player.compare_players("Player name 1", "Player name 2") to compare two different players' information
   Player.find_batting_average("Player name") to check a batter's batting average
   Player.find_pitching_era("Player name) to check a pitcher's earned runs average
   Player.delete_player("Player name") to delete a specific player from the local database

  Team Class - 
    Team.team_info("Team name here") to retrive a team's name, city, and venue
    Team.compare_teams("Team name 1", "Team name 2") to compare two different teams' information
    Team.display_players("Team name here") to display all players on a specific team in 2017
    Team.delete_team("Team name here") to delete a specific team from the local database

  Contributers:
    This applicationw as created by Riley Iverson of Seattle, Washington and Dustin Rothschild of San Jose, California

  Acknowledgements: 
    We would like to acknowledge the API used "MLB Data API" found at: https://appac.github.io/mlb-data-api-docs/#stats-data-career-hitting-stats-get
   