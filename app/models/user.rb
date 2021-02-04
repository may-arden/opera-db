class User < ApplicationRecord
    has_many :notes
    has_many :songs, through: :notes 

    has_secure_password

    validates :username, presence: true, uniqueness: { message: "%{value} is already in use, please select a different username"}
  

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.password = SecureRandom.hex(15)
        end 
    end 

end
