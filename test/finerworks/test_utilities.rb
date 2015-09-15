require 'test_helper'

class TestUtilities < Minitest::Test
  # Verify that parse_api_time correctly parses time strings.
  def test_parse_api_time
    assert_equal Time.new(2015, 9, 13, 21, 0, 05, "-06:00"), FinerWorks::Utilities.parse_api_time("2015-09-13T21:00:05-06:00")
    assert_equal Time.new(2015, 9, 13, 0, 0, 0, "-06:00"), FinerWorks::Utilities.parse_api_time("2015-09-13T00:00:00-06:00")
    assert_equal Time.new(2015, 9, 13, 21, 0, 05, "-06:00"), FinerWorks::Utilities.parse_api_time("2015-09-13T21:00:05")
  end
end
