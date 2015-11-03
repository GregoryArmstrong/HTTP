class Parser

  attr_accessor :parse_all

  def initialize(array)
    @array = array
    @parse_all = {}
    parse_all_info
  end

  def set_verb
    verb = @array[0].split(' ').first
  end

  def set_path
    split_element = @array[0].split(' ')
    path = split_element[1]
  end

  def set_protocol
    split_element = @array[0].split(' ')
    protocol = split_element[2]
  end

  def set_host
    split_element = @array[1].split(':')
    host = split_element[0]
  end

  def set_address
    split_element = @array[1].split(':')
    address = split_element[1].strip
  end

  def set_port
    split_element = @array[1].split(':')
    port = split_element[2]
  end

  def set_user_agent_title
    split_element = @array[2].split(':')
    user_agent_title = split_element[0]
  end

  def set_user_agent_info
    split_element = @array[2].split(' ')
    split_element.shift
    user_agent_info = split_element.join(' ')
  end

  def set_accept_title
    split_element = @array[3].split(':')
    accept_title = split_element[0]
  end

  def set_accept_info
    split_element = @array[3].split(' ')
    accept_info = split_element[1]
  end

  def set_accept_language_title
    split_element = @array[4].split(':')
    accept_language = split_element[0]
  end

  def set_accept_language_info
    split_element = @array[4].split(' ')
    accept_language_info = split_element[1]
  end

  def set_accept_encoding_title
    split_element = @array[5].split(':')
    accept_encoding_title = split_element[0]
  end

  def set_accept_encoding_info
    split_element = @array[5].split(' ')
    split_element.shift
    accept_encoding_info = split_element.join(' ')
  end

  def set_DNT_title
    split_element = @array[6].split(':')
    dnt_title = split_element[0]
  end

  def set_DNT_info
    split_element = @array[6].split(' ')
    dnt_info = split_element[1]
  end

  def set_connection_title
    split_element = @array[7].split(':')
    connection_title = split_element[0]
  end

  def set_connection_info
    split_element = @array[7].split(' ')
    connection_info = split_element[1]
  end

  def set_cache_control_title
    split_element = @array[8].split(':')
    cache_control_title = split_element[0]
  end

  def set_cache_control_info
    split_element = @array[8].split(' ')
    cache_control_info = split_element[1]
  end

  def parse_all_info
    @parse_all["Verb"] = set_verb
    @parse_all["Path"] = set_path
    @parse_all["Protocol"] = set_protocol
    @parse_all[set_host] = set_address
    @parse_all["Port"] = set_port
    @parse_all[set_user_agent_title] = set_user_agent_info
    @parse_all[set_accept_title] = set_accept_info
    @parse_all[set_accept_language_title] = set_accept_language_info
    @parse_all[set_accept_encoding_title] = set_accept_encoding_info
    @parse_all[set_DNT_title] = set_DNT_info
    @parse_all[set_connection_title] = set_connection_info
    @parse_all[set_cache_control_title] = set_cache_control_info
    @parse_all
  end

end
