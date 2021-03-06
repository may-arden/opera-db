class Song < ApplicationRecord
  belongs_to :opera
  belongs_to :user
  has_many :notes
  has_many :users, through: :notes 
  validates :title, presence: { message: "cannot be blank"}
  validates :opera_id, presence: { message: "cannot be blank"}
  # this method needs to find a song where the first letters in its title
  # match the input into the text field 
  scope :find_specific, ->(title) { where('title LIKE ?', "%#{title}%") } 

  # presence true, length etc
  # make a partial for errors 

  def title_and_opera
    "#{self.title} - #{self.opera.name}"
  end 

 # accepts_nested_attributes_for :opera

  def opera_attributes=(attr_hash)
    self.opera = Opera.find_or_create_by(attr_hash)
  end 

  # def find_specific_songs
  #   self.where
  # end 

end

