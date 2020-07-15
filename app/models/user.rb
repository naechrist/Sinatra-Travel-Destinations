class User < ActiveRecord::Base 
    has_secure_password #alows us to authanticate 
    has_many :travel_destinations
end 