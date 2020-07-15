class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name 
      t.string :email 
      t.string :password_digest #makes the password hidden, using bcrypt
      
      t.timestamps null: false
    end 
  end
end
