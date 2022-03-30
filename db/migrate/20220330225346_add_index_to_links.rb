class AddIndexToLinks < ActiveRecord::Migration[7.0]
  def change
    add_index :links, :href, unique: true
    change_column_default :links, :clicks, 0
  end
end
