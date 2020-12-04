class Team < ActiveRecord::Base
        has_many :contracts
        has_many :players, through: :contracts

    def team_name(url, team_input)
        team = GetRequester.new(url)
        team_parsed = team.parse_json
        team_parsed["team_all_season"]["queryResults"]["row"].each do |team|
            if team["name_display_full"] == team_input
                return team["name_display_full"]
            end
        end
    end

    def self.get_team(team_name)
        team = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.team_all_season.bam?sport_code='mlb'&all_star_sw='N'&sort_order=name_asc&season='2017'")
        team_parsed = team.parse_json
        team_parsed["team_all_season"]["queryResults"]["row"].find{|club| club["name_display_full"] == team_name}["team_id"]
    end

    def self.add_team(team_name)
        #player_id = self.get_player(first_name, last_name)
        new_team = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.team_all_season.bam?sport_code='mlb'&all_star_sw='N'&sort_order=name_asc&season='2017'")
        new_team_parsed = new_team.parse_json
        extra_new_team = new_team_parsed["team_all_season"]["queryResults"]["row"].find{|club| club["name_display_full"] == team_name}
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

end