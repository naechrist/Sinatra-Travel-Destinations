class AddTitleToTravelDestinations < ActiveRecord::Migration
  def change
    add_column :travel_destinations, :title, :string
  end
end
