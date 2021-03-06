require 'test_helper'

class TestImage < Minitest::Test
  def setup
    @image = FinerWorks::Image.new(read_fixture_as_json("image.json"))
  end

  # Verify that Image correctly initializes its attributes from the Web API.
  def test_attributes
    assert_equal Time.utc(2015, 2, 19, 17, 25, 3), @image.date_added
    assert @image.active?
    assert @image.gallery_active?
    assert_equal "Awesome Image", @image.title
  end
end
