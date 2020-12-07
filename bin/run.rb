
require_relative '../config/environment'

puts "Welcome, here is a list of commands that you can run: 'Player stats', 'Compare players', 'Batting average', 'Pitching ERA', 'Delete player', 'Team info', 'Compare teams', 'Display team players', 'Delete team'"
input = gets.chomp

if input == "Player stats"
    puts "Player Name"
    player_name = gets.chomp
    Player.player_info(player_name)
end

if input == "Compare players"
    puts "Choose player one"
    player_name1 = gets.chomp
    puts "Choose player two"
    player_name2 = gets.chomp
    Player.compare_players(player_name1, player_name2)
end

if input == "Batting average"
    puts "Choose batter"
    player_name = gets.chomp
    Player.find_batting_average(player_name)
end

if input == "Pitching ERA"
    puts "Choose pitcher"
    player_name = gets.chomp
    Player.find_pitching_era(player_name)
end

if input == "Delete player"
    puts "Choose player to delete from local database"
    player_name = gets.chomp
    Player.delete_player(player_name)
end

if input == "Team info"
    puts "Choose team"
    team_name = gets.chomp
    Team.team_info(team_name)
end

if input == "Compare teams"
    puts "Choose team one"
    team_name1 = gets.chomp
    puts "Choose team two"
    team_name2 = gets.chomp
    Team.compare_teams(team_name1, team_name2)
end

if input == "Display team players"
    puts "Choose team"
    team_name = gets.chomp
    Team.display_players(team_name)
end

if input == "Delete team"
    puts "Choose team to delete from local database"
    team_name = gets.chomp
    Team.delete_team(team_name)
end

puts "Information invalid, please type a valid command listed above"












