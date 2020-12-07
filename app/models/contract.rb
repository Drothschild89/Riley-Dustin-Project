class Contract < ActiveRecord::Base
    belongs_to :player
    belongs_to :team

    def self.new_contract(player, team)
        Contract.find_or_create_by(player_id: player, team_id: team)
        puts "Contract between #{Player.find(player).name} and #{Team.find(team).name}"
    end

    def self.delete_contract(player, team)
        team_id = Team.find_by(name: team).id
        player_id = Player.find_by(name: player).id
        Contract.delete(Contract.find_by(player_id: player_id, team_id: team_id).id)
        puts "#{player}, #{team} has been deleted from table"
    end

end