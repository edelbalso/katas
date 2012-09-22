module Algorithms

  module Progressive

    def calculate
      @index = {}

      Dictionary.each_word do |word|
        insert_into_index word
      end
      #@size_index.each do |s,ws|
      #  find_anagrams ws
      #end
    end


    def insert_into_index word
      k = letter_count_hash word
      w = word.downcase.chomp

      @index[k] ||= []
      @index[k] << w unless @index[k].include? w
    end
    
    def letter_count_hash word

      def convert_lc counts

        str = ""
        counts.each do |k,v|
          str << "#{v.to_s}"
        end

        str
      end

      letter_counts = {}
      ('a'..'z').each{ |l| letter_counts[l] = 0}

      word.each_byte do |w|
        letter_counts[w.chr.downcase] += 1 unless w.chr == "\n" if letter_counts.has_key? w.chr.downcase
      end
 
      convert_lc letter_counts
    end

    def show_results
      @index.each do |k,v|
        if v.size > 1
          puts "Found :: #{v.inspect}"
        end
      end
    end
  end
end
