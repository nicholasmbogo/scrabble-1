gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_scrabble_exists
    scrabble = Scrabble.new

    assert_instance_of Scrabble, scrabble
  end

  def test_it_can_score_a_single_letter

    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_single_letter
    scrabble = Scrabble.new

    assert_equal 8, scrabble.score("hello")
  end

  def test_can_score_an_empty_string
    scrabble = Scrabble.new

    assert_equal 0, scrabble.score("")
  end

  def test_can_score_when_someone_passes_nil
    scrabble = Scrabble.new

    assert_equal 0, scrabble.score(nil)
  end

  def test_can_score_with_letter_multiplier
    scrabble = Scrabble.new

    assert_equal 9, scrabble.score_with_multipliers("hello", [1,2,1,1,1])
  end

  def test_can_Score_a_Word_with_a_Word_Multiplier
    scrabble = Scrabble.new

    assert_equal 18, scrabble.score_with_multipliers("hello", [1,2,1,1,1], 2)
  end

  def test_can_Score_a_Word_with_a_7_Letter_Bonus
    scrabble = Scrabble.new

    assert_equal 58, scrabble.score_with_multipliers("sparkle", [1,2,1,3,1,2,1], 2)
  end
end
