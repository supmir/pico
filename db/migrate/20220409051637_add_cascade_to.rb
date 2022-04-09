class AddCascadeTo < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :analytics, :shortened_links
    remove_foreign_key :shortened_links, :links
    add_foreign_key :analytics, :shortened_links, on_delete: :cascade
    add_foreign_key :shortened_links, :links, on_delete: :cascade
  end
  def down
    remove_foreign_key :analytics, :shortened_links
    remove_foreign_key :shortened_links, :links
    add_foreign_key :analytics, :shortened_links
    add_foreign_key :shortened_links, :links
  end
end
