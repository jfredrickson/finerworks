require 'test_helper'

class TestImage < Minitest::Test
  def setup
    @image = FinerWorks::Image.new(read_fixture("image.json"))
  end

  # Verify that Image correctly initializes its attributes from the Web API.
  def test_attributes
    assert_equal Time.new(2015, 9, 13, 20, 16, 25, "-06:00"), @image.date_added
    assert @image.active?
    assert_equal "Awesome Image", @image.title
  end
end
