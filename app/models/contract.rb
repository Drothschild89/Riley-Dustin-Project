class Contract < ActiveRecord::Base
    belongs_to :player
    belongs_to :team

    def self.new_contract(player, team)
        Contract.find_or_create_by(player_id: player, team_id: team)
    end

end