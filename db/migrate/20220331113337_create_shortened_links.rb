class CreateShortenedLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_links do |t|
      t.string :path
      t.references :link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
