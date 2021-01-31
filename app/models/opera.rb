class Opera < ApplicationRecord
    has_many :songs 
    validates :name, presence: true, uniqueness: true


    def opera_attributes=(attributes)
       self.opera = Opera.find_or_create_by(attributes) if !attributes['name'].empty?
       self.opera
    end
end
