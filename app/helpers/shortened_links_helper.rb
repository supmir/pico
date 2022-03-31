module ShortenedLinksHelper
    def generate_new_name()
        (0...15).map { (65 + rand(26)).chr }.join
    end
end
