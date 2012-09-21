require 'pry'

class AnagramFinder
  def initialize
    @words = {}
    setup_hash
  end

  def test_word word
    key = word.chars.sort.join
    puts @words[key].join(" ")
  end

  private

  def setup_hash
    File.open('/usr/share/dict/words','r').each do |word|
      word.strip!
      key = word.chars.sort.join
      @words[key] ||= []
      @words[key] << word
    end
  end
end

finder = AnagramFinder.new
finder.test_word('colters')
