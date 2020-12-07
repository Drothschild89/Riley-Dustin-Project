class Team < ActiveRecord::Base
        has_many :contracts
        has_many :players, through: :contracts

   def self.get_team(team_name)
        team = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.team_all_season.bam?sport_code='mlb'&all_star_sw='N'&sort_order=name_asc&season='2017'")
        team_parsed = team.parse_json
        final_team_parsed = team_parsed["team_all_season"]["queryResults"]["row"].find{|club| club["name_display_full"] == team_name}
        if !final_team_parsed
            puts "This team doesn't seem to exist, please try again"
            exit
        end
        final_team_parsed["team_id"]
    end

    def self.add_team(team_name)
        new_team = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.team_all_season.bam?sport_code='mlb'&all_star_sw='N'&sort_order=name_asc&season='2017'")
        new_team_parsed = new_team.parse_json
        extra_new_team = new_team_parsed["team_all_season"]["queryResults"]["row"].find{|club| club["name_display_full"] == team_name}
        if !extra_new_team
            puts "This team doesn't seem to exist, please try again"
            exit
        end
        name = extra_new_team["name_display_full"]
        city = extra_new_team["city"]
        venue = extra_new_team["venue_name"]
        self.find_or_create_by(name: name, city: city, venue: venue)
    end

    def self.team_info(team)
        Team.add_team(team)
        find_data = Team.find_by(name: team)
        puts find_data.name
        puts find_data.city
        puts find_data.venue
    end

    def self.compare_teams(team1, team2)
        self.team_info(team1)
        self.team_info(team2)
    end

    def self.display_players(team)
        team_id = self.get_team(team)
        team_players = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.roster_40.bam?team_id='#{team_id}'")
        team_players_parsed = team_players.parse_json
        new_team_parsed = team_players_parsed["roster_40"]["queryResults"]["row"]
        puts "All the players for #{team}:"
        display_teams = new_team_parsed.each{|team| puts team["name_display_first_last"]}
        nil
    end

    def self.delete_team(name)
        Team.delete(Team.find_by(name: name).id)
        puts "#{name} deleted from table"
    end

end