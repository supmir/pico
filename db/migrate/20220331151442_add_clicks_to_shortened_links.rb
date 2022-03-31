class AddClicksToShortenedLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :shortened_links, :clicks, :integer
    change_column_default :shortened_links, :clicks, 0
  end
end
