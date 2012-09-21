class Anagrammer

  def initialize
    @size_index = {}
  end

  def start
    words do |w|
      @size_index[w.size] ||= []
      @size_index[w.size] << w
    end

    show_distribution
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
end