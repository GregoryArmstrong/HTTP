require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './http_experiment'

class HttpExperimentTest < Minitest::Test

  def test_can_start_server
    e = Experiment.new

    assert e
  end

  def test_counter_counts
  end

  def test_it
  end




end
