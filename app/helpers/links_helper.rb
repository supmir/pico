require 'nokogiri'
require 'open-uri'

module LinksHelper
    def get_page_title(href)
        doc = Nokogiri::HTML(URI.open(href))
        doc.at_css('title').text
    end
end
