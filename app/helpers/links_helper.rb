require 'nokogiri'
require 'open-uri'

module LinksHelper
    def get_page_title(href)
        begin
            data = URI.open(href)
            doc = Nokogiri::HTML(data)
        rescue
            href = self.switch_protocol(href)
            data = URI.open(href)
            doc = Nokogiri::HTML(data)
        end
        doc.at_css('title').text
    end
    def switch_protocol(href)
        if href =~ /^https:\/\//
            href[0..7] = 'http://'
        elsif href =~ /^http:\/\//
            href[0..6] = 'https://'
        end
        href
    end
end
