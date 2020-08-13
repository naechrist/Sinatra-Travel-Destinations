class User < ActiveRecord::Base 
    has_secure_password #alows us to authanticate 

    validates :name, presence: true 
    validates :email, presence: true
    validates :email, uniqueness: true #no 2 users w the same email

    has_many :travel_destinations
end 
