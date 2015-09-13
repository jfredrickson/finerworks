require 'minitest/autorun'
require 'finerworks'

class Minitest::Test
  def read_fixture(filename)
    file = "#{File.dirname(__FILE__)}/fixtures/#{filename}"
    data = File.read(file)
    JSON.parse(data)
  end
end
