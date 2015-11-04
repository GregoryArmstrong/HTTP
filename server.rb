require 'socket'
require 'pry'
require './parser'
require './request_handler'

class Server

  attr_accessor :request_counter

  tcp_server = TCPServer.new(9292)
  @request_counter = 0
  client = tcp_server.accept

  loop do

    puts "Ready for a request"

    request_lines = []
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    @request_counter += 1

    parser = Parser.new(request_lines)
    rh = RequestHandler.new(parser, @request_counter)

    puts "Got this request:"
    puts request_lines.inspect

    puts "Sending response."

    headers = ["http/1.1 200 ok",
              "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
              "server: ruby",
              "content-type: text/html; charset=iso-8859-1",
              "content-length: #{rh.output.length}\r\n\r\n"].join("\r\n")

    client.puts headers
    client.puts rh.output

    puts ["Wrote this response:", headers, rh.output].join("\n")
    if rh.path == "/shutdown"
      break
    end
  end

  client.close
  puts "\nResponse complete, exiting."

end
