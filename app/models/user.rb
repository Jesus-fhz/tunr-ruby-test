class User < ApplicationRecord
    #Use the bcrypt gem to encrypt password, at the point of creating a new user object in the DB
    #And store only the encrypted version
    has_secure_password
    has_many  :mixtapes

    validates :email, presence: true, uniqueness: true
    
end