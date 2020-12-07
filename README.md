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
 4. In console type: ruby bin/run.rb
 5. Follow prompts in console
 
 How To Use:
  After typing ruby bin/run.rb type in one of the following
    -'Player info' to see information on a player
    -'Compare players' to compare two players' information
    -'Batting average' to see a batter's batting average
    -'Pitching ERA' to see a pitcher's earned runs average
    -'Delete player' to delete a player from the local database
    -'Team info' to see information on a team
    -'Compare teams' to compare two teams' information
    -'Display team players' to display all players on a team in 2017
    -'Delete team' to delete a team from the local database
    -'exit' to exit out of the program

  Contributers:
    This application was created by Riley Iverson of Seattle, Washington and Dustin Rothschild of San Jose, California

  Acknowledgements: 
    We would like to acknowledge the API used "MLB Data API" found at: https://appac.github.io/mlb-data-api-docs/#stats-data-career-hitting-stats-get
   
