class AddColsToAnalytics < ActiveRecord::Migration[7.0]
  def change
    add_column :analytics, :ip, :string
    add_column :analytics, :city, :string
    add_column :analytics, :country, :string
  end
end
