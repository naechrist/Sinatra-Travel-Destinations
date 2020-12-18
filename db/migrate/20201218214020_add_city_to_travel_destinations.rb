class AddCityToTravelDestinations < ActiveRecord::Migration
  def change
    add_column :travel_destinations, :city, :string
  end
end
