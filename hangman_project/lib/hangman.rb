class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_accessor :secret_word, :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
    # p guess_word
  end

  def already_attempted?(ch)
    @attempted_chars.include?(ch)
  end

  def get_matching_indices(ch)
    arr_of_indices = []
    @secret_word.each_char.with_index do |c, i|
      if c == ch
        arr_of_indices << i
      end
    end
    arr_of_indices
  end

  def fill_indices(ch, arr)
    arr.each do |i|
      @guess_word[i] = ch
    end
  end

  def try_guess(ch)
    if already_attempted?(ch)
      puts 'that has already been attempted'
      return false
    else
      @attempted_chars << ch
      arr_of_indices = get_matching_indices(ch)
      if arr_of_indices.empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(ch, arr_of_indices)
      end
      return true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    try_guess(gets.chomp)
  end

  def win?
    if @secret_word == @guess_word.join
      puts 'WIN'
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    end
    false
  end

    def game_over?
      if win? || lose?
        puts @secret_word
        return true
      else
        return false
      end
    end
end
