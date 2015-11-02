require 'socket'
tcp_server = TCPServer.new(9292)
client = tcp_server.accept
request_counter = 0


loop do
  puts "Ready for a request"
  request_lines = []
  while line = client.gets and !line.chomp.empty?
    request_lines << line.chomp
  end
  request_counter += 1

  puts "Got this request:"
  puts request_lines.inspect


  puts "Sending response."
  response = "<pre>" + request_lines.join("\n") + "</pre>"
  response2 = "<p>Hello, World! (#{request_counter})</p>"
  output = "<html><head></head><body>#{response}#{response2}</body></html>"
  headers = ["http/1.1 200 ok",
            "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
            "server: ruby",
            "content-type: text/html; charset=iso-8859-1",
            "content-length: #{output.length}\r\n\r\n"].join("\r\n")
  client.puts headers
  client.puts output

  puts ["Wrote this response:", headers, output].join("\n")

  puts "Enter quit to stop server:"
  closer = gets.chomp
  break if closer == "quit"
end




puts "\nResponse complete, exiting."
