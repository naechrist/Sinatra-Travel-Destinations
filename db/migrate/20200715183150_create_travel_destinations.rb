class CreateTravelDestinations < ActiveRecord::Migration
  def change
    create_table :travel_destinations do |t|
      t.string :content 
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
