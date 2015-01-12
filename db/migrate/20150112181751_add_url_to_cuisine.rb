class AddUrlToCuisine < ActiveRecord::Migration
  def change
    add_column :cuisines, :url, :string
  end
end
