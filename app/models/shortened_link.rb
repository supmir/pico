class ShortenedLink < ApplicationRecord
  has_many :analytics
  belongs_to :link

  def sorted_analytics
    self.analytics.order("created_at DESC")
  end

  def self.create_shortened_link(link)
    loop do
      @path = ApplicationController.helpers.generate_new_name
      shortened_link = ShortenedLink.find_by_path(@path)
      if !shortened_link
        break
      end
    end
    
    shortened_link = ShortenedLink.new(
      path:@path,
      link:link
      )

    shortened_link.save
    return shortened_link
  end
end
