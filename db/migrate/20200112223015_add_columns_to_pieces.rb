class AddColumnsToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :row_position, :integer
    add_column :pieces, :column_position, :integer
  end
end
