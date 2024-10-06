require 'open-uri'

class GamesController < ApplicationController
  def new
    @random_letters = Array('A'..'Z').sample(10)
    session[:random_letters] = @random_letters
  end

  def score
    # Your logic to process the submitted word
    submitted_word = params[:word].upcase
    random_letters = session[:random_letters]

    if !word_valid?(submitted_word, random_letters)
      @message = 'Word is out of the original grid'
    elsif !word_exist?(submitted_word)
      @message = 'Word does not exist'
    else
      @message = "Well done! You've submitted a valid word. Your score is #{10 * submitted_word.length}"
    end

    render :score
  end

  private

  def word_valid?(word, grid)
    word.chars.all? do |letter|
      word.count(letter) <= grid.count(letter)
    end
  end

  def word_exist?(word)
    url = "https://dictionary.lewagon.com/#{word}"
    result_serialized = URI.parse(url).read
    result_parsed = JSON.parse(result_serialized)
    result_parsed[:found]
  end
end
