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
    elsif @path.include?("/word_search")
      dictionary
    else
      @path == "/shutdown"
      shut_down
    end
  end

  def dictionary
    dictionary = File.read("/usr/share/dict/words")
    analyzed_words = []
    split_path_once = @path.split("&")
    split_path_twice = split_path_once.map do |element|
      element.split("=")
    end
    split_path_twice.each do |element|
      if dictionary.include?(element[1])
        analyzed_words << "#{element[1].upcase} is a known word!"
      else
        analyzed_words << "#{element[1].upcase} is not a known word!"
      end
    end
    formatted_analyzed_words = analyzed_words.each do |thing|
      puts "#{thing}\n"
    end
    @output = "<html><head></head><body><pre>#{formatted_analyzed_words.join("\n")}</pre></body></html>"
  end


  #   if dictionary.include?(split_path[1])
  #     @output = "<html><head></head><body><pre>#{split_path[1].upcase} is a known word!</pre></body></html>"
  #   else
  #     @output = "<html><head></head><body><pre>#{split_path[1].upcase} is not a known word!</pre></body></html>"
  #   end
  # end

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
