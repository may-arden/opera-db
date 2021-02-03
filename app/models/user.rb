class User < ApplicationRecord
    has_many :notes
    has_many :songs, through: :notes 

    has_secure_password

    validates :username, presence: true, uniqueness: true 


end
