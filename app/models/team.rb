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


    # def self.new_team
    #     self.new.team_name("http://lookup-service-prod.mlb.com/json/named.team_all_season.bam?sport_code='mlb'&all_star_sw='N'&sort_order=name_asc&season='2017'", "Oakland Athletics")
    # end

end