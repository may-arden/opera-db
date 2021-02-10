class Note < ApplicationRecord
  belongs_to :song
  belongs_to :user
  validates :title, presence: { message: "please be sure to fill in all of the fields"}
  validates :content, presence: { message: "please be sure to fill in all of the fields"} 

  ## this scope method allows us to call most recently published note 
  def self.most_recent
    self.order('created_at desc').first
  end

  def self.random_note
    self.all.sample 
  end 



  


end