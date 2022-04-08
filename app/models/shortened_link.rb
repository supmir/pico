class ShortenedLink < ApplicationRecord
  has_many :analytics
  belongs_to :link

  def sorted_analytics
    self.analytics.order("created_at DESC")
  end
end
