class Link < ApplicationRecord
    has_many :shortened_links

    def self.find_or_create_new_using_href(href)
      if !(href =~ /^https?:\/\//)
        href = 'http://' + href
      end
      @link = Link.find_by_href(href)
      if !@link
        (@title, @href) = ApplicationController.helpers.get_page_title(href)
        @link = Link.find_by_href(@href)
        if !@link
          @link = Link.new(title:@title, href:@href)
          @link.save
        end
      end
      @link
    end
end
