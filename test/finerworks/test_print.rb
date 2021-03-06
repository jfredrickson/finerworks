require 'test_helper'

class TestPrint < Minitest::Test
  def setup
    @print = FinerWorks::Print.new(read_fixture_as_json("print.json"))
  end

  # Verify that Print correctly initializes its attributes from the Web API.
  def test_attributes
    assert_equal "Untitled", @print.title
    assert_equal "12345678-abcd-abcd-abcd-12345678abcd", @print.guid
    assert_equal Time.utc(2015, 9, 13, 21, 0, 5), @print.date_added
    assert_equal 50.0, @print.sale_price
    assert_equal "", @print.card_stock_name
  end
end
