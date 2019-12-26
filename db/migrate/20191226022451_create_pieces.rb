class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :game_id
      t.string :player
      t.string :color,           null: false, default: "B"
      t.string :type,            null: false, default: "Pawn"
      t.string :location,        null: false, default: "A1"
      t.string :piece_status,    null: false, default: "Inactive"
      t.datetime :occurred
      t.timestamps
    end
  end
end
