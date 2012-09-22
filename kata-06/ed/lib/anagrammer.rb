$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'pry'
require 'algorithms/first_pass'
require 'algorithms/progressive'
require 'dictionary'

class Anagrammer

  include Algorithms::Progressive

  def start
    calculate
    show_results
  end

end
