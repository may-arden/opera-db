class Note < ApplicationRecord
  belongs_to :song
  belongs_to :user
  validates :title, presence: true 
  validates :content, presence: true 
  # scope :created_at, -> { where (created_at: true) }

  def self.most_recent
    self.order('created_at desc').first
  end



  ## above scope method allows us to call
  # Note.published.featured.latest_
  # Note.featured.title


end