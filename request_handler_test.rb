require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './request_handler'
require './parser'

class RequestHandlerTest < Minitest::Test

  def test_can_create_request_handler_instance
    skip
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

  def test_handler_can_read_path
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

    assert_equal "/", rh.path
  end

  def test_handler_can_read_path_slash_and_assign_output
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

    assert_equal "<html><head></head><body><pre>Verb: GET\nPath: /\nProtocol: HTTP/1.1\nHost: 127.0.0.1\nPort: 9292\nUser-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:41.0) Gecko/20100101 Firefox/41.0\nAccept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\nAccept-Language: en-US,en;q=0.5\nAccept-Encoding: gzip, deflate\nDNT: 1\nConnection: keep-alive\nCache-Control: max-age=0</pre></body></html>", rh.output
  end

  def test_handler_can_read_path_hello_world_and_assign_output
    parser_1 = Parser.new(["GET /hello HTTP/1.1",
        "Host: 127.0.0.1:9292",
        "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:41.0) Gecko/20100101 Firefox/41.0",
        "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language: en-US,en;q=0.5",
        "Accept-Encoding: gzip, deflate",
        "DNT: 1",
        "Connection: keep-alive",
        "Cache-Control: max-age=0"])
    rh = RequestHandler.new(parser_1)


    assert_equal "/hello", rh.path
    assert_equal "<html><head></head><body><pre>Hello, World! ()</pre></body></html>", rh.output
  end

  def test_handler_can_read_path_date_time_and_assign_output

    parser_1 = Parser.new(["GET /datetime HTTP/1.1",
        "Host: 127.0.0.1:9292",
        "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:41.0) Gecko/20100101 Firefox/41.0",
        "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language: en-US,en;q=0.5",
        "Accept-Encoding: gzip, deflate",
        "DNT: 1",
        "Connection: keep-alive",
        "Cache-Control: max-age=0"])
    rh = RequestHandler.new(parser_1)

    assert_equal "/datetime", rh.path
    assert_equal "<html><head></head><body><pre>#{Time.now.strftime('%H:%M%p on %A %B %e, %Y')}</pre></body></html>", rh.output
  end

  def test_handler_can_read_path_shutdown_and_assign_output
    parser_1 = Parser.new(["GET /shutdown HTTP/1.1",
        "Host: 127.0.0.1:9292",
        "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:41.0) Gecko/20100101 Firefox/41.0",
        "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language: en-US,en;q=0.5",
        "Accept-Encoding: gzip, deflate",
        "DNT: 1",
        "Connection: keep-alive",
        "Cache-Control: max-age=0"])
    rh = RequestHandler.new(parser_1)

    assert_equal "/shutdown", rh.path
    assert_equal "<html><head></head><body><pre>Total Requests: #{@request_counter}</pre></body></html>", rh.output
  end

end
