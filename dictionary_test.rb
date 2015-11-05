require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './dictionary'

class DictionaryTest < Minitest::Test

def test_dictionary_class
  assert Dictionary
end

def test_input_is_a_string
  d = Dictionary.new(string)
end

def test_dictionary_starts_with_empty_array
end

def test_dictionary_has_external_dictionary
end

def test_split_word_search_path_outputs_data
end

def test_shoveler_creates_new_array_of_one_word
end

def test_shoveler_creates_array_of_multiple_wors
end

def word_analyzer_outputs_checked_words
end

end
