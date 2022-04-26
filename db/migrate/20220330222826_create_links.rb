class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :href
      t.integer :clicks
      # TODO: Add hash

      t.timestamps
    end
  end
end
