require 'pry'

class Anagrammer

  def initialize
    @size_index = {}
    @anagrams = {}
  end

  def start
    words do |w|
      @size_index[w.size] ||= []
      @size_index[w.size] << w
    end

    show_distribution
    puts "calculating..."

    calculate

    show_results
  end

  def calculate
    @size_index.each do |s,ws|
      find_anagrams ws
    end
  end

  def show_results

  end

  def show_distribution
    @size_index.sort.each do |k, v|
      puts "#{'%02d' % k} :: #{v.size}"
    end
  end

  def words
    File.open('/usr/share/dict/words','r').each { |w|
      yield w
    }
  end

  private

  def find_anagrams arr

    def convert_lc counts,word

      str = ""
      counts.each do |k,v|
        str << "#{k}#{v.to_s}"
      end

      #binding.pry
    end

    letter_counts = {}
    index = {}

    ('a'..'z').each{ |l| letter_counts[l] = 0}

    arr.each do |word|
      begin
      word.each_byte do |w|
        letter_counts[w.chr.downcase] += 1 unless w.chr == "\n" if letter_counts.has_key? w.chr.downcase
      end
      rescue
        binding.pry
      end
      index[convert_lc(letter_counts,word)] ||= []
      index[convert_lc(letter_counts,word)] << word.downcase.chomp unless index[convert_lc(letter_counts,word)].include? word.downcase.chomp


      ('a'..'z').each{ |l| letter_counts[l] = 0}
    end

    index.each do |k,v|
      if v.size > 5
        puts "Found :: #{v.inspect}"
      end
    end

  end
end