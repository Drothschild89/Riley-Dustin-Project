class Player < ActiveRecord::Base
    has_many :contracts
    has_many :teams, through: :contracts

    def self.get_player(first_name, last_name)
        player = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.search_player_all.bam?sport_code=%27mlb%27&active_sw=%27Y%27&name_part=%27#{first_name}_#{last_name}%25%27")
        player_parsed = player.parse_json
        player_parsed["search_player_all"]["queryResults"]["row"]["player_id"]
    end

    def self.add_player(first_name, last_name)
        new_player = GetRequester.new("http://lookup-service-prod.mlb.com/json/named.search_player_all.bam?sport_code=%27mlb%27&active_sw=%27Y%27&name_part=%27#{first_name}_#{last_name}%25%27")
        new_player_parsed = new_player.parse_json
        player = new_player_parsed["search_player_all"]["queryResults"]["row"]
        name = player["name_display_first_last"]
        position = player["position"]
        birth_country = player["birth_country"]
        self.find_or_create_by(name: name, position: position, birth_country: birth_country)
        add_team = Team.add_team(player["team_full"])
        new_contract = Contract.new_contract(Player.find_by(name: name).id, Team.find_by(name: player["team_full"]).id)
    end

    def self.player_stats(first_name, last_name)
        full_name = first_name + " " + last_name
        Player.add_player(first_name, last_name)
        find_data = Player.find_by(name: full_name)
        puts find_data.name
        puts find_data.position
        puts find_data.birth_country
    end

    def self.compare_players(player1, player2)
        player1_split = player1.split(" ")
        player2_split = player2.split(" ")
        self.player_stats(player1_split[0], player1_split[1])
        self.player_stats(player2_split[0], player2_split[1])
    end

end