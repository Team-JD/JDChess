class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :player1,              null: false, default: ""
      t.string :player1Color,         null: false, default: "B"
      t.string :player2,              null: false, default: ""
      t.string :player2Color,         null: false, default: "W"
      t.string :status,               null: false, default: "In Progress"
      t.string :winner
      t.string :loser
      t.string :current_turn          null: false, default: player1
      t.timestamps :started           null: false, default: timestamps
      t.timestamps :ended 
      t.timestamps
    end
  end
end
