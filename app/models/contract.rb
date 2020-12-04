class Contract < ActiveRecord::Base
    belongs_to :player
    belongs_to :team

    def self.new_contract(player, team)
        Contract.create(player_id: player, team_id: team)
    end
    
end