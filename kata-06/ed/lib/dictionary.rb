class Dictionary
  def self.each_word
    #File.open('../data/input.txt','r').each { |w|
    File.open('/usr/share/dict/words','r').each { |w|
      yield w
    }
  end
end