class User < ApplicationRecord
    has_many :notes
    has_many :songs, through: :notes 

    has_secure_password
end
