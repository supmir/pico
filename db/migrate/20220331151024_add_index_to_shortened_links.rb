class AddIndexToShortenedLinks < ActiveRecord::Migration[7.0]
  def change
    add_index :shortened_links, :path, unique: true
  end
end
