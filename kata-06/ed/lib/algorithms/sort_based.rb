module Algorithms
  module SortBased

    def calculate
      @index = {}

      Dictionary.each_word do |word|
        insert_into_index word
      end

    end


    def insert_into_index word
      k = sort_hash word
      w = word.downcase.chomp

      @index[k] ||= []
      @index[k] << w unless @index[k].include? w
    end

    def sort_hash word
      word.split('').sort.join
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