class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize(word)
    @word = word
	@guesses = ''
	@wrong_guesses = ''
  end

	attr_accessor:word
	attr_accessor:guesses
	attr_accessor:wrong_guesses
	
	def check_win_or_lose()
	  if @wrong_guesses.length >= 7
	    return :lose
	  elsif !word_with_guesses().include? '-'
	    return :win
	  else
	    return :play
	  end
	end
	

  def word_with_guesses()
    w = ''
    @word.split("").each do |i|
      if @guesses.include? i
        w += i
      else
        w += '-'
      end
    end
    return w
  end


  def guess_several_letters(letters)
    letters.split("").each do |i|
      guess(i)
    end
  end

  def guess(letter)
    if letter !~ /[a-z]/i
      raise ArgumentError.new("Invalid Argument")
    end
    letter = letter.downcase
    if @word.include? letter
      if !@guesses.include? letter
        @guesses += letter
        return true
      end
      return false
    else
      if !@wrong_guesses.include? letter
	      @wrong_guesses += letter
	      return true
	    end
	     return false
    end
  end


  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
