module Algorithms

  module FirstPass

    def calculate
      @size_index = {}
      @index = {}

      Dictionary.each_word do |w|
        @size_index[w.size] ||= []
        @size_index[w.size] << w
      end
      puts @size_index
      @size_index.each do |s,ws|
        find_anagrams ws
      end
    end

    def find_anagrams arr

      def convert_lc counts,word

        str = ""
        counts.each do |k,v|
          str << "#{k}#{v.to_s}"
        end

      end

      letter_counts = {}
      @index = {}

      ('a'..'z').each{ |l| letter_counts[l] = 0}

      arr.each do |word|
        begin
        word.each_byte do |w|
          letter_counts[w.chr.downcase] += 1 unless w.chr == "\n" if letter_counts.has_key? w.chr.downcase
        end
        rescue
          binding.pry
        end
        @index[convert_lc(letter_counts,word)] ||= []
        @index[convert_lc(letter_counts,word)] << word.downcase.chomp unless @index[convert_lc(letter_counts,word)].include? word.downcase.chomp


        ('a'..'z').each{ |l| letter_counts[l] = 0}
      end

    end

    def show_results
      @index.each do |k,v|
        if v.size > 5
          puts "Found :: #{v.inspect}"
        end
      end
    end

    def show_distribution
      @size_index.sort.each do |k, v|
        puts "#{'%02d' % k} :: #{v.size}"
      end
    end

  end
end
