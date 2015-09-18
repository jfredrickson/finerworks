require 'test_helper'

class TestOrder < Minitest::Test
  def setup
    @order = FinerWorks::Order.new(read_fixture("order.json"))
  end

  # Verify that Order correctly initializes its attributes from the Web API.
  def test_attributes
    assert_equal "10517", @order.id
    # TODO: Need to figure out the time zone issue
    #assert_equal Time.new(2015, 9, 8, 10, 50, 18, "-06:00"), @order.date_time
    assert_equal "21.95", @order.grand_total
    assert_equal "7", @order.status_id
  end
end
