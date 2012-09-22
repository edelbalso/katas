require 'pry'

# with marshal loading hash
# real	0m1.658s
# user	0m1.478s
# sys	0m0.166s

# without marshal loading hash
# real	0m6.108s
# user	0m5.845s
# sys	0m0.244s

class AnagramFinder
  def initialize
    @anagrams = anagram_hash
  end

  def get_anagrams(word)
    key = word.chars.sort.join
    anagrams = @anagrams[key]

    if !anagrams.nil? && anagrams.count > 1
      @anagrams[key].join(" ")
    else
      nil
    end
  end

  def compute_answers
    string_to_write = ''

    File.open('input.txt','r').each_with_index do |word, i|
      word.strip!
      anagrams_string = get_anagrams(word)
      string_to_write << anagrams_string << "\n" unless anagrams_string.nil?
    end

    File.open('my_answers.txt', 'w') do |f|
      f.write string_to_write
    end
  end

  private

  def anagram_hash
    words = {}

    if File.exists?('hash')
      words = load_from_file
    else
      File.open('/usr/share/dict/words','r').each do |word|
        word.strip!
        key = word.chars.sort.join
        words[key] ||= []
        words[key] << word
      end

      # dump so we don't have to create hash next time
      File.open('hash','w') do |f|
        f.write Marshal.dump(words)
      end
    end

    words
  end

  def load_from_file
    Marshal.load File.binread('hash')
  end
end

finder = AnagramFinder.new
finder.compute_answers
#finder.get_anagrams('colters')
