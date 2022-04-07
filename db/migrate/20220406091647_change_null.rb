class ChangeNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :links, :title, false
    change_column_null :links, :href, false
  end
end
