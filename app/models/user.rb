class User < ApplicationRecord
    has_many :notes
    has_many :songs, through: :notes 
end
