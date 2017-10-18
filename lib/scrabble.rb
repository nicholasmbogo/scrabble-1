class Scrabble

  attr_reader :point_values

  def initialize

  @point_values = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
        }
  end


  def score(word)
    return 0 if word.nil?
    letters = word.upcase.chars
    letters.inject(0) do |sum, letter|
      sum += @point_values[letter]
    end
  end

  def score_with_multipliers(word, letter_multipliers, word_multiplier = 1)
    letters = word.upcase.chars
    result = letters.map.with_index do |letter, index|
      @point_values[letter] * letter_multipliers[index]
      #result.inject(0)
      #result * word_multiplier

    end.reduce(:+)
    #result * word_multiplier

    if word.length >= 7
      result += 10
      
    end
    result * word_multiplier

  end
end
