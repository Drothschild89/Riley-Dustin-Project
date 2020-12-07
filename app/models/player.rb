class Player < ActiveRecord::Base
        has_many :contracts
        has_many :teams, through: :contracts

    def self.get_player(name)
        name_split = name.split(" ")
        player = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.search_player_all.bam?sport_code=%27mlb%27&active_sw=%27Y%27&name_part=%27#{name_split[0]}_#{name_split[1]}%25%27")
        player_parsed = player.parse_json
        player_parsed["search_player_all"]["queryResults"]["row"]["player_id"]
    end

    def self.add_player(name)
            name_split = name.split(" ")
            new_player = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.search_player_all.bam?sport_code=%27mlb%27&active_sw=%27Y%27&name_part=%27#{name_split[0]}_#{name_split[1]}%25%27")
            new_player_parsed = new_player.parse_json
            player = new_player_parsed["search_player_all"]["queryResults"]["row"]

            if !player
                puts "This player doesn't seem to exist, please try again"
                exit
            else 

            name = player["name_display_first_last"]
            position = player["position"]
            birth_country = player["birth_country"]

            self.find_or_create_by(name: name, position: position, birth_country: birth_country)
            add_team = Team.add_team(player["team_full"])
            new_contract = Contract.new_contract(Player.find_by(name: name).id, Team.find_by(name: player["team_full"]).id)
        end
    end

    def self.player_stats(name)
        Player.add_player(name)
        find_data = Player.find_by(name: name)

        puts find_data.name
        puts find_data.position
        puts find_data.birth_country
    end

    def self.compare_players(player1, player2)
        self.player_stats(player1)
        self.player_stats(player2)
    end

    def self.find_batting_average(name)
        self.add_player(name)
        if Player.find_by(name: name).position == 'P'
            puts "Pitcher's do not have a batting average, please enter a player who bats"
        else
            player_id = self.get_player(name)
            player = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.sport_career_hitting.bam?league_list_id='mlb'&game_type='R'&player_id='#{player_id}'")
            player_parsed = player.parse_json
            puts "#{name}'s batter average is: " + player_parsed["sport_career_hitting"]["queryResults"]["row"]["avg"]
        end
    end

    def self.find_pitching_era(name)
        self.add_player(name)
        if Player.find_by(name: name).position == 'P'
            player_id = self.get_player(name)
            player = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.sport_career_pitching.bam?league_list_id='mlb'&game_type='R'&player_id='#{player_id}'")
            player_parsed = player.parse_json
            puts "#{name}'s earned runs average is: " + player_parsed["sport_career_pitching"]["queryResults"]["row"]["era"]
        else
            puts "Only pitchers have an ERA, please insert a pitcher"
        end
    end

    def self.delete_player(name)
        Player.delete(Player.find_by(name: name).id)
        puts "#{name} has been deleted from table"
    end

end