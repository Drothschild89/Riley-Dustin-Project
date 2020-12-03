class Player

    def player_name(url)
        player = GetRequester.new(url)
        player_parsed = player.parse_json
        player_parsed["player_info"]["queryResults"]["row"]["name_display_first_last"]
    end

    
end