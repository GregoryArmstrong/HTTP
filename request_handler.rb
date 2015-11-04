class RequestHandler

  attr_accessor :parser, :output, :path

  def initialize(parser=nil, request_counter=nil)
    @parser = parser
    @path = @parser.parse_all["Path"]
    @request_counter = request_counter
    analyze_path
  end

  def analyze_path
    if @path == "/"
      debugger
    elsif @path == "/hello"
      hello_world
    elsif @path == "/datetime"
      date_time
    else
      @path == "/shutdown"
      shut_down
    end
  end

  def debugger
    output_hash = @parser.parse_all
    storage = []
    output_hash.each_pair do |key, value|
      storage << "#{key}: #{value}"
    end
    formatted_storage = storage.join("\n")
    @output = "<html><head></head><body><pre>#{formatted_storage}</pre></body></html>"
  end

  def hello_world
    @output = "<html><head></head><body><pre>Hello, World! (#{@request_counter})</pre></body></html>"
  end

  def date_time
    @output = "<html><head></head><body><pre>#{Time.now.strftime('%H:%M%p on %A %B %e, %Y')}</pre></body></html>"
  end

  def shut_down
    @output = "<html><head></head><body><pre>Total Requests: #{@request_counter}</pre></body></html>"
  end

end
