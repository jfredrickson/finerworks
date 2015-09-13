require 'test_helper'

class TestGallery < Minitest::Test
  def setup
    @gallery = FinerWorks::Gallery.new(read_fixture("gallery.json"))
  end

  # Verify that Gallery correctly initializes its attributes from the Web API.
  def test_attributes
    assert_equal "Gallery 1", @gallery.title
    assert @gallery.active?
    assert_equal "f82dd0bd-4711-4578-ac47-4661257e69a6", @gallery.guid
  end
end
