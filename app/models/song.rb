class Song < ApplicationRecord
  belongs_to :opera
  belongs_to :user
  has_many :notes
  has_many :users, through: :notes 

  accepts_nested_attributes_for :opera

# instance method which displays the song title & the name of the opera it belongs to
  def title_and_opera
    "#{self.title} - #{self.opera.name}"
  end 

end

