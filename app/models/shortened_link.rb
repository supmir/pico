class ShortenedLink < ApplicationRecord
  has_many :analytics
  belongs_to :link
end
