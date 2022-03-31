class AddLatToAnalytics < ActiveRecord::Migration[7.0]
  def change
    add_column :analytics, :lat, :string
    add_column :analytics, :lon, :string
  end
end
