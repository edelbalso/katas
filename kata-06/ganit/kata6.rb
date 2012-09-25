require 'pry'

full_list = [
   "kinship",
   "pinkish",
   "enlist",
   "inlets",
   "listen",
   "silent",
   "boaster",
   "boaters",
   "borates",
   "fresher",
   "refresh",
   "sinks",
   "skins",
   "knits",
   "stink",
   "rots",
   "sort"]

$scoring_system = {
  "a" =>2,
  "b" =>3,
  "c" =>5,
  "d" =>7,
  "e" =>11,
  "f" =>13,
  "g" =>17,
  "h" =>19,
  "i" =>23,
  "j" =>29,
  "k" =>31,
  "l" =>37,
  "m" =>41,
  "n" =>43,
  "o" =>47,
  "p" =>53,
  "q" =>59,
  "r" =>61,
  "s" =>67,
  "t" =>71,
  "u" =>73,
  "v" =>79,
  "w" =>83,
  "x" =>89,
  "y" =>97,
  "z" =>101,
  "-" =>0
}

# returns hash of all anagrams
def analyzefile(full_list)
  $combined = {}

  File.open('/usr/share/dict/words','r').each do |word|
    word.strip!

    score = 0
    word.chars.each do |l|
      l.downcase!
      score += $scoring_system[l]
    end

    $combined[score] ||= []
    $combined[score] << word
  end

end

def get_anagrams(input)
  score = 0
  input.chars.each do |l|
    l.downcase!
    score += $scoring_system[l]
  end
  puts $combined[score]
end

analyzefile(full_list)

print 'type a word => '
input = gets.chomp
get_anagrams(input)

