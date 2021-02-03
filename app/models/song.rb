class Song < ApplicationRecord
  belongs_to :opera
  belongs_to :user
  has_many :notes
  has_many :users, through: :notes 
  validates :title, presence: true
  validates :opera, presence: :true 

  # presence true, length etc
  # make a partial for errors 

  # accepts_nested_attributes_for :opera

# instance method which displays the song title & the name of the opera it belongs to
  def title_and_opera
    "#{self.title} - #{self.opera.name}"
  end 

  def opera_attributes=(attr_hash)
    self.opera = Opera.find_or_create_by(attr_hash)
  end 

end

