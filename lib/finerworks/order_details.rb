module FinerWorks
  class OrderDetails < Hashie::Trash
    property :id, from: "OrderID"
    property :status_label, from: "OrderStatusLabel"
    property :cart_id, from: "OrderCartID"
    property :shipping_option_method, from: "ShippingOptionMethod"
    property :customer_guid, from: "OrderCustomerGUID"
    property :shipping_code, from: "OrderShippingCode"
    property :shipping_id, from: "OrderShippingID"
    property :status_id, from: "OrderStatusID"
    property :sub_total, from: "OrderSubTotal"
    property :sales_tax, from: "OrderSalesTax"
    property :discount, from: "OrderDiscount"
    property :shipping, from: "OrderShipping"
    property :credits_used, from: "OrderCreditsUsed"
    property :grand_total, from: "OrderGrandTotal"
    property :date_time, from: "OrderDateTime", transform_with: lambda { |d| Time.parse(d) }
    property :drop_ship, from: "OrderDropShip", transform_with: lambda { |value| value == "True" }
    property :shipping_instructions, from: "OrderShippingInstructions"
    property :payment_method_name, from: "PaymentMethodName"
    property :customer_details, from: "CustomerDetails", with: lambda { |d| CustomerDetails.new(d) }
    property :order_items, from: "OrderItems", with: lambda { |items| items.map { |i| OrderItem.new(i) } }

    alias_method :drop_ship?, :drop_ship
  end

  class CustomerDetails < Hashie::Trash
    property :customer_id, from: "CustomerID"
    property :customer_guid, from: "CustomerGUID"
    property :customer_billing_details, from: "CustomerBillingDetails", with: lambda { |d| CustomerBillingDetails.new(d) }
    property :customer_shipping_details, from: "CustomerShippingDetails", with: lambda { |d| CustomerShippingDetails.new(d) }
    property :customer_payment_details, from: "CustomerPaymentDetails"
  end

  class CustomerBillingDetails < Hashie::Trash
    property :first_name, from: "CustomerBillFirstName"
    property :middle_name, from: "CustomerBillMiddleName"
    property :last_name, from: "CustomerBillLastName"
    property :company, from: "CustomerBillCompany"
    property :address1, from: "CustomerBillAddress1"
    property :address2, from: "CustomerBillAddress2"
    property :city, from: "CustomerBillCity"
    property :state, from: "CustomerBillState"
    property :zip, from: "CustomerBillZip"
    property :state_other, from: "CustomerBillStateOther"
    property :country, from: "CustomerBillCountry"
    property :phone, from: "CustomerBillPhone"
    property :email, from: "CustomerBillEmail"
  end

  class CustomerShippingDetails < Hashie::Trash
    property :ship_is_bill, from: "CustomerShipIsBill"
    property :first_name, from: "CustomerShipFirstName"
    property :middle_name, from: "CustomerShipMiddleName"
    property :last_name, from: "CustomerShipLastName"
    property :company, from: "CustomerShipCompany"
    property :address1, from: "CustomerShipAddress1"
    property :address2, from: "CustomerShipAddress2"
    property :city, from: "CustomerShipCity"
    property :state, from: "CustomerShipState"
    property :zip, from: "CustomerShipZip"
    property :state_other, from: "CustomerShipStateOther"
    property :country, from: "CustomerShipCountry"
    property :phone, from: "CustomerShipPhone"
  end

  class OrderItem < Hashie::Trash
    property :print_product_id, from: "PrintProductID"
    property :print_product_print_guid, from: "PrintProductPrintGUID"
    property :print_product_title, from: "PrintProductTitle"
    property :print_product_qty, from: "PrintProductQty"
    property :print_product_price, from: "PrintProductPrice"
    property :print_product_type_id, from: "PrintProductTypeID"
    property :print_product_name, from: "PrintProductName"
    property :static_product_name, from: "StaticProductName"
    property :static_product_id, from: "StaticProductID"
  end
end
