class User < ApplicationRecord
    has_many :notes
    has_many :songs, through: :notes 

    has_secure_password

    # add validation for user uniqueness for whatever attribute they use to login 
    # display error messages associated with users 
end
