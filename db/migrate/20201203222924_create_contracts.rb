class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.integer :player_id
      t.integer :team_id
    end
  end
end
