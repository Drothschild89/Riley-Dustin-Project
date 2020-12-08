 <h1>MLB Stats Lookup</h1>
 
<p>The MLB stats lookup uses an API (Application Programming Interface) to retrieve data about teams and players. The application retrieves the information from the API and stores it in a local database. You can use this to look up specific statistics or to compare player and team information.</p>

Video demonstration: https://youtu.be/kz5A2_9e84Q
 
 <h3>Prerequisites: </h3>
 <p>This application is using Ruby v.2.6.1</p>
 <p>This application is using the following Gemfiles:</p>
 <ul>
  <li>"sinatra-activerecord"</li>
  <li>"sqlite3"</li>
  <li>"require_all"</li>
  <li>"rake"</li>
  <li>"pry"</li>
 </ul>
 
 <h3>Installation:</h3>
 <ol>
  <li>git clone https://github.com/Drothschild89/Riley-Dustin-Project.git</li>
  <li>In console type: bundle install</li>
  <li>In console type: rake db:migrate</li>
  <li>In console type: ruby bin/run.rb</li>
  <li>Follow prompts in console</li>
 </ol>
 
 <h3>How To Use:</h3>
  After typing ruby bin/run.rb type in one of the following
  <ul>
    <li>'Player info' to see information on a player</li>
    <li>'Compare players' to compare two players' information</li>
    <li>'Batting average' to see a batter's batting average</li>
    <li>'Pitching ERA' to see a pitcher's earned runs average</li>
    <li>'Delete player' to delete a player from the local database</li>
    <li>'Team info' to see information on a team</li>
    <li>'Compare teams' to compare two teams' information</li>
    <li>'Display team players' to display all players on a team in 2017</li>
    <li>'Delete team' to delete a team from the local database</li>
    <li>'exit' to exit out of the program</li>
 </ul>

 <h4>Contributers:</h4>
 <p>This application was created by: 
 <ul>
  <li>Riley Iverson of Seattle, Washington - rmiverson99@gmail.com</li>
  <li>Dustin Rothschild of San Jose, California - Drothschild89@gmail.com</li>
  </ul>
  </p>

  <h4>Acknowledgements:</h4
  <p>We would like to acknowledge the API used "MLB Data API" found at: https://appac.github.io/mlb-data-api-docs/#stats-data-career-hitting-stats-get</p>
   
