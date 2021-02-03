class Note < ApplicationRecord
  belongs_to :song
  belongs_to :user
  validates :title, presence: true 
  validates :content, presence: true 
  scope :published, -> { where(published: true)}

  def self.latest_note
    order('published_at desc').first
  end

  def self.titles
    pluck(:title)
  end 

  ## above scope method allows us to call
  # Note.published.featured.latest_article
  # Note.featured.title


end
