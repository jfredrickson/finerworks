require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require 'minitest'
require 'minitest/autorun'
require 'webmock/minitest'
require 'finerworks'

class Minitest::Test
  def read_fixture(filename)
    file = "#{File.dirname(__FILE__)}/fixtures/#{filename}"
    data = File.read(file)
  end

  def read_fixture_as_json(filename)
    JSON.parse(read_fixture(filename))
  end
end
