require 'test_helper'

class TestCart < Minitest::Test
  def setup
    @cart = FinerWorks::Cart.new(read_fixture_as_json("cart.json"))
  end

  # Verify that Cart correctly initializes its attributes from the Web API.
  def test_attributes
    assert_equal "84f40cec-0959-44ed-aaaa-44709af3e8df", @cart.guid
    assert_equal Time.utc(2015, 10, 31, 2, 17, 18), @cart.expiration
  end
end
