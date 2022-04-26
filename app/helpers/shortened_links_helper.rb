module ShortenedLinksHelper
  @@words = File.readlines("words.txt", chomp: true)
  @@target_length = 15

  def generate_new_name()
    generated = @@words.sample
    loop do
      word = @@words.sample
      if (generated + word).length > @@target_length
        break
      end
      generated = generated +"-"+ word
    end
    generated
  end
end
