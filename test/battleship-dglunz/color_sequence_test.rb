require_relative 'test_helper'

class ColorSequenceTest < Minitest::Test
  def test_compare_correct_guess
    color_sequence = ColorSequence.new("rgby")
    assert_equal({elements: 4, positions: 4, guess: "rgby"}, color_sequence.guess("rgby"))
  end

  def test_color_correct_spot
    color_sequence = ColorSequence.new("rbbb")
    assert_equal({elements: 1, positions: 1, guess: "rggg"}, color_sequence.guess("rggg"))
  end

  def test_color_correct_but_incorrect_position
    color_sequence = ColorSequence.new("rbbb")
    assert_equal({elements: 1, positions: 0, guess: "gggr"}, color_sequence.guess("gggr"))
  end

  def test_does_not_count_multiples
    color_sequence = ColorSequence.new("rgby")
    assert_equal({elements: 1, positions: 1, guess: "rrrr"}, color_sequence.guess("rrrr"))
  end

  def test_does_not_count_multiples_in_different_position
    color_sequence = ColorSequence.new("rbby")
    assert_equal({elements: 1, positions: 0, guess: "grrg"}, color_sequence.guess("grrg"))
  end

  def test_nothing_correct
    color_sequence = ColorSequence.new("gggg")
    assert_equal({elements: 0, positions: 0, guess: "rrrr"}, color_sequence.guess("rrrr"))
  end
end
