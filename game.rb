class Game

  attr_accessor :guess_counter, :secret_number, :path, :game_output

  def initialize(parser, secret_number=nil, guess_counter=nil)
    @parser = parser
    @path = parser.parse_all["Path"]
    @guess_counter = guess_counter
    @secret_number = secret_number
    if @path == "/start_game"
      start_game
    else
      guess_status
    end
  end

  def start_game
    @game_output = "<html><head></head><body><pre>Good luck!</pre></body></html>"
    @guess_counter = 0
    @secret_number = rand(100)
  end

  def guess_status
    @game_output = "#{@guess_counter} guesses made, last guess:"
  end











end
