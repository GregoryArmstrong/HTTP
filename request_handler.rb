class RequestHandler

  attr_accessor :parser, :output

  def initialize(parser=nil)
    @parser = parser
    analyze_path
    debugger
  end

  def analyze_path
    @parser.parse_all["Path"]
  end

  def debugger
    output_hash = @parser.parse_all
    storage = []
    output_hash.each_pair do |key, value|
      storage << "#{key}: #{value}"
    end
    formatted_storage = "<pre>" + storage.join("\n") + "</pre>"
    @output = formatted_storage
  end

end
