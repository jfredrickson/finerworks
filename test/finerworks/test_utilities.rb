require 'test_helper'

class TestUtilities < Minitest::Test
  # Verify that parse_api_time correctly parses time strings.
  def test_parse_api_time
    assert_equal Time.new(2015, 9, 13, 0, 0, 0, "-06:00"), FinerWorks::Utilities.parse_api_time("2015-09-13T21:00:05-05:00")
    assert_equal Time.new(2015, 9, 13, 0, 0, 0, "-06:00"), FinerWorks::Utilities.parse_api_time("2015-09-13T00:00:00-05:00")
    assert_equal Time.new(2015, 9, 13, 0, 0, 0, "-06:00"), FinerWorks::Utilities.parse_api_time("2015-09-13T21:00:05")
    assert_equal Time.new(2015, 11, 30, 0, 0, 0, "-06:00"), FinerWorks::Utilities.parse_api_time("2015-11-30T00:00:00")
    assert_equal Time.new(2015, 3, 8, 0, 0, 0, "-06:00"), FinerWorks::Utilities.parse_api_time("2015-03-08T01:59:59")
    assert_equal Time.new(2015, 3, 8, 0, 0, 0, "-06:00"), FinerWorks::Utilities.parse_api_time("2015-03-08T03:00:00")
  end
end
