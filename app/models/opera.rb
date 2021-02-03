class Opera < ApplicationRecord
    has_many :songs 
    validates :name, presence: true


# custom writer method so that a new object isn't instantiated every time
# and the object isn't duplicated in DB 
    def opera_attributes=(attributes)
       self.opera = Opera.find_or_create_by(attributes) if !attributes['name'].empty?
       self.opera
    end
end
