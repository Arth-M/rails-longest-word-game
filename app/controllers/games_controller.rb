class GamesController < ApplicationController
  require 'open-uri'
  require 'json'
      def new
    @letters = [];
    alphabet = ("a".."z").to_a;
    10.times do
      al = alphabet.shuffle;
      @letters << al[0];
    end
    @strLetter = @letters.join
  end

  def score
    @word=params[:suggestedWord]
    @letters=params[:listOfLetters].split('')

    # word_letters = @word.split('');
    # word_letters.each do |letter|
    #   base_letters.each_with_index do |base_letter, index|
    #     if base_letter == letter
    #       base_letter[index]="";
    #       true
    #     end
    #   end
    # end
    all_letters_in_grid=[];
    @word.downcase.chars do |letter|
      if @letters.include?(letter)
        index = @letters.find_index(letter)
        @letters.delete_at(index)
        all_letters_in_grid << true;
        # p true
      else
        all_letters_in_grid << false;
        # p false
      end
    end
    @test_all = all_letters_in_grid.all?

    uri = URI.open("https://dictionary.lewagon.com/#{@word}")
    uri2 = JSON.parse(uri.read)
    uri2["found"]

    # if @test_all && uri2["found"]
    #   @message = "Your score is"
    # else
    #   @message = ""
    # end
  end
end
