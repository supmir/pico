class RemoveClicksFromLinks < ActiveRecord::Migration[7.0]
  def change
    remove_column :links, :clicks, :integer
  end
end
