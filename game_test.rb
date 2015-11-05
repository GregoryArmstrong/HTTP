require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './game'

class GameTest < Minitest::Test

  def test_can_create_game_instance
    g = Game.new("path")

    assert g
  end

  def test_path_is_slash_start_game
    g = Game.new("/start_game")

    assert_equal "/start_game", g.path
  end

  def test_starts_game_when_first_posted_to
    g = Game.new("/start_game")

    assert_equal "Good luck!", g.game_output
    assert_equal 0, g.guess_counter
    refute_equal 101, g.secret_number
  end












end
