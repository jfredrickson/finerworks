require 'finerworks/request'
require 'finerworks/response'
require 'finerworks/account'
require 'finerworks/print'
require 'finerworks/gallery'
require 'finerworks/image'
require 'finerworks/order'
require 'finerworks/order_details'

module FinerWorks
  class Client
    attr_accessor :account_api_key

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    # Provides account profile information.
    def account
      result = FinerWorks::Request.get(self, "/Account")
      FinerWorks::Account.new(result.json)
    end

    # Updates account profile information.
    def update_account(account)
      result = FinerWorks::Request.post(self, "/Account", build_post_account_json(account))
    end

    # Lists prints stored in My Prints Inventory.
    #
    # ==== Options hash:
    # ["ImageGUID"] Filter by image.
    # ["GalleryGUID"] Filter by gallery.
    def prints(options = {})
      get(FinerWorks::Print, "/Prints", options)
    end

    # Lists galleries (aka portfolios) under the current account.
    def galleries
      get(FinerWorks::Gallery, "/Galleries")
    end

    # Lists images stored in My Images.
    #
    # ==== Options hash:
    # ["GalleryGUID"] Filter by gallery.
    # ["Sort"] Sort images by upload date in ascending or descending order. Possible values are "ASC" and "DESC".
    #          Default is descending.
    def images(options = {})
      get(FinerWorks::Image, "/Images", options)
    end

    # Lists orders
    #
    # ==== Options hash:
    # ["OrderDateTime_Start"] Search for orders in the range starting at the specified date/time.
    # ["OrderDateTime_End"] Search for orders in the range ending at the specified date/time.
    # ["OrderStatusID"] Search for orders with a specific status.
    # ["OrderID"] Find a specific order by ID.
    # ["Sort"] Sort orders by ID in ascending or descending order. Possible values are "ASC" and "DESC". Default is
    #          descending.
    def orders(options = {})
      get(FinerWorks::Order, "/Orders", options)
    end

    # Provides order details.
    #
    # ==== Parameters:
    # [id] Order ID number.
    def order_details(id)
      get(FinerWorks::OrderDetails, "/OrderDetails", { "OrderID" => id })
    end

    # Generic GET method to request items of the specified +type+. This always returns an +Array+.
    def get(type, path, options = {})
      response = FinerWorks::Request.get(self, path, options)
      items = response.json.kind_of?(Array) ? response.json : [response.json]
      results = []
      items.each do |item|
        results << type.new(item)
      end
      results
    end

    def build_post_account_json(account)
      {
        "AccountApiKey" => account_api_key,
        "AccountUsername" => account.username,
        "AccountUpdate_Info" => {
          "AccountEmail" => account.email,
          "AccountFirstName" => account.first_name,
          "AccountMiddleName" => account.middle_name,
          "AccountLastName" => account.last_name,
          "AccountPhone" => account.phone,
          "AccountBio" => account.bio,
          "AccountTitle" => account.title
        }
      }
    end
  end
end
