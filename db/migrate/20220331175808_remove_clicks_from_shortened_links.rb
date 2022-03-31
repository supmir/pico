class RemoveClicksFromShortenedLinks < ActiveRecord::Migration[7.0]
  def change
    remove_column :shortened_links, :clicks, :integer
  end
end
