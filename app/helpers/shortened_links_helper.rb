module ShortenedLinksHelper
    @@words = File.readlines("words.txt", chomp: true)
    @@target_length = 15

    def generate_new_name()
        generated = @@words.sample
        loop do
            word = @@words.sample
            if generated + word > @@target_length
                break
            end
            generated = generated +"-"+ word
        end
        generated
    end
    # def generate_new_name()
    #     generated = @@words.sample
    #     loop do
    #         generated = self.make_longer(generated)
    #         if generated.length==@@target_length
    #             break
    #         end
    #     end
    #     (0...15).map { (65 + rand(26)).chr }.join
    # end

    # def make_longer(name)
    #     name = name + "-"
    #     name = self.get_by_length(name.length-@@target_length)
    # end

    # def get_by_length(length)
    #     correct_lengths = self.correct_lengths(length)
    #     loop do
    #         word = @@words.sample
    #         if word.length in correct_lengths
    #             break
    #         end
    #     end
    # end

    # def correct_lengths(desired_length)
    #     ret = [desired_length]
    #     if desired_length-1-@@min_length
    #     ret.append()



    # end
end
