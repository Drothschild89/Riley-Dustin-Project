
require_relative '../config/environment'
run = true

while run == true do 
    puts "Welcome, here is a list of commands that you can run: 'Player info', 'Compare players', 'Batting average', 'Pitching ERA', 'Delete player', 'Team info', 'Compare teams', 'Display team players', 'Delete team', 'exit'"
    input = gets.chomp

    if input == "Player info"
        puts "Player Name"
        player_name = gets.chomp
        Player.player_info(player_name)

    elsif input == "Compare players"
        puts "Choose player one"
        player_name1 = gets.chomp
        puts "Choose player two"
        player_name2 = gets.chomp
        Player.compare_players(player_name1, player_name2)

    elsif input == "Batting average"
        puts "Choose batter"
        player_name = gets.chomp
        Player.find_batting_average(player_name)

    elsif input == "Pitching ERA"
        puts "Choose pitcher"
        player_name = gets.chomp
        Player.find_pitching_era(player_name)

    elsif input == "Delete player"
        puts "Choose player to delete from local database"
        player_name = gets.chomp
        Player.delete_player(player_name)

    elsif input == "Team info"
        puts "Choose team"
        team_name = gets.chomp
        Team.team_info(team_name)

    elsif input == "Compare teams"
        puts "Choose team one"
        team_name1 = gets.chomp
        puts "Choose team two"
        team_name2 = gets.chomp
        Team.compare_teams(team_name1, team_name2)

    elsif input == "Display team players"
        puts "Choose team"
        team_name = gets.chomp
        Team.display_players(team_name)

    elsif input == "Delete team"
        puts "Choose team to delete from local database"
        team_name = gets.chomp
        Team.delete_team(team_name)

    elsif input == "exit"
        run = false
        exit

    else 
        puts "Information invalid, please type a valid command listed above"
    end
end














