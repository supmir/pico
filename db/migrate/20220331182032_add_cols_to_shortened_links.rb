class AddColsToShortenedLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :shortened_links, :ip, :string
    add_column :shortened_links, :lat, :string
    add_column :shortened_links, :lon, :string
  end
end
