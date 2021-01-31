class Song < ApplicationRecord
  belongs_to :opera
  belongs_to :user
  has_many :notes
  has_many :users, through: :notes 

# instance method which displays the song title & the name of the opera it belongs to
  def title_and_opera
  end 

end

