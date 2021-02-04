class Song < ApplicationRecord
  belongs_to :opera
  belongs_to :user
  has_many :notes
  has_many :users, through: :notes 
  validates :title, presence: { message: "please be sure to fill in all of the fields"}
  validates :opera_id, presence: { message: "please be sure to fill in all of the fields"}

  # presence true, length etc
  # make a partial for errors 


  def title_and_opera
    "#{self.title} - #{self.opera.name}"
  end 

 # accepts_nested_attributes_for :opera

  def opera_attributes=(attr_hash)
    self.opera = Opera.find_or_create_by(attr_hash)
  end 

end

