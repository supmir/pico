class Link < ApplicationRecord
    has_many :shortened_links

    def self.create_new_using_href(href)
      @title = ApplicationController.helpers.get_page_title(href)
      Link.new(title:@title, href:href)
    end
end
