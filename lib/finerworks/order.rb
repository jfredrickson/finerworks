module FinerWorks
  class Order < Hashie::Trash
    property :id, from: "OrderID"
    property :grand_total, from: "OrderGrandTotal"
    property :date_time, from: "OrderDateTime", transform_with: lambda { |d| FinerWorks::Utilities.parse_api_time(d) }
    property :drop_ship, from: "OrderDropShip"
    property :status_id, from: "OrderStatusID"
    property :status_label, from: "OrderStatusLabel"
  end
end
