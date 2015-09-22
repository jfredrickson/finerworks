require 'test_helper'

class TestOrderDetails < Minitest::Test
  def setup
    @order_details = FinerWorks::OrderDetails.new(read_fixture_as_json("order_details.json"))
  end

  # Verify that OrderDetails correctly initializes its attributes from the Web API.
  def test_attributes
    assert_equal 12345, @order_details.id
    assert_equal Time.utc(2015, 9, 22, 16, 47, 38), @order_details.date_time
    assert_equal 33.95, @order_details.grand_total
    assert_equal 7, @order_details.status_id
    refute @order_details.drop_ship?
    customer_details = @order_details.customer_details
    assert_equal FinerWorks::CustomerDetails, customer_details.class
    customer_billing_details = customer_details.customer_billing_details
    assert_equal FinerWorks::CustomerBillingDetails, customer_billing_details.class
    customer_shipping_details = customer_details.customer_shipping_details
    assert_equal FinerWorks::CustomerShippingDetails, customer_shipping_details.class
    order_items = @order_details.order_items
    assert_equal Array, order_items.class
    assert_equal 2, order_items.count
    order_items.each do |oi|
      assert_equal FinerWorks::OrderItem, oi.class
    end
  end
end
