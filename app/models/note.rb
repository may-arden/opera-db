class Note < ApplicationRecord
  belongs_to :song
  belongs_to :user
  validates :title, presence: { message: "please be sure to fill in all of the fields"}
  validates :content, presence: { message: "please be sure to fill in all of the fields"} 
  # scope :created_at, -> { where (created_at: true) }

  def self.most_recent
    self.order('created_at desc').first
  end



  ## above scope method allows us to call most recently published note 


end