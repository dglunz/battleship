class ColorSequence
  attr_reader :colors

  def initialize(colors=random)
    @colors = colors
  end

  def random(size=4)
    @colors = ''
    available_colors = ['r','g','b','y','w','b']
    size.times { @colors << available_colors[0..size-1].sample }
    @colors
  end

  def guess(guess_sequence)
    elements = correct_elements(guess_sequence)
    positions = correct_positions(guess_sequence)
    results(elements, positions, guess_sequence)
  end

  private

  def results(elements, positions, guess)
    {
      elements: elements,
      positions: positions,
      guess: Display.colorful(guess)
    }
  end

  def correct_positions(guess_sequence)
    guess_sequence.split("").select.with_index do |letter, index|
      letter == colors[index]
    end.count
  end

  def correct_elements(guess_sequence)
    colors_copy = colors.split("")
    guess_sequence.split("").select do |letter|
      if colors_copy.include?(letter)
        colors_copy.slice!(colors_copy.index(letter))
      end
    end.count
  end
end
