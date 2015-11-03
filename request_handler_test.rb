require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './request_handler'
require './parser'

class RequestHandlerTest < Minitest::Test

  def test_can_create_request_handler_instance
    rh = RequestHandler.new

    assert rh
  end

  def test_handler_can_take_parser_as_initialized_data
    parser_1 = Parser.new(["GET / HTTP/1.1",
        "Host: 127.0.0.1:9292",
        "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:41.0) Gecko/20100101 Firefox/41.0",
        "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language: en-US,en;q=0.5",
        "Accept-Encoding: gzip, deflate",
        "DNT: 1",
        "Connection: keep-alive",
        "Cache-Control: max-age=0"])
    rh = RequestHandler.new(parser_1)

    assert_equal "GET", rh.parser.parse_all["Verb"]
  end

  def test_handler_can_read_path_and_make_decision
    parser_1 = Parser.new(["GET / HTTP/1.1",
        "Host: 127.0.0.1:9292",
        "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:41.0) Gecko/20100101 Firefox/41.0",
        "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language: en-US,en;q=0.5",
        "Accept-Encoding: gzip, deflate",
        "DNT: 1",
        "Connection: keep-alive",
        "Cache-Control: max-age=0"])
    rh = RequestHandler.new(parser_1)

    assert_equal "/", rh.analyze_path
  end














end
