require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './request_handler'

class RequestHandlerTest < Minitest::Test

  def test_can_create_request_handler_instance
    rh = RequestHandler.new

    assert rh
  end














end
