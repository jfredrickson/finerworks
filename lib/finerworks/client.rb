require 'finerworks/request'
require 'finerworks/response'
require 'finerworks/account'
require 'finerworks/print'
require 'finerworks/gallery'
require 'finerworks/image'
require 'finerworks/order'
require 'finerworks/order_details'

module FinerWorks
  # The Client is the primary interface to the FinerWorks Web API.
  #
  # @attr [String] account_api_key A FinerWorks account API key.
  class Client
    attr_accessor :account_api_key

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    # Provides account profile information.
    #
    # @return [Account] Account information. Returns the account associated with the client's API key.
    def account
      result = FinerWorks::Request.get(self, "/Account")
      FinerWorks::Account.new(result.json)
    end

    # Updates account profile information.
    #
    # @param [Account] account Account information.
    # @return [Response] API response.
    def update_account(account)
      result = FinerWorks::Request.post(self, "/Account", build_post_account_json(account))
    end

    # Lists prints stored in My Prints Inventory.
    #
    # @param [Hash] options Filtering options.
    # @option options [String] "ImageGUID" Find prints based on a specific image.
    # @option options [String] "GalleryGUID" Find prints whose images are under a specific gallery.
    # @return [Array<Print>] A list of prints.
    def prints(options = {})
      get(FinerWorks::Print, "/Prints", options)
    end

    # Lists galleries (aka portfolios) under the current account.
    #
    # @return [Array<Gallery>] A list of galleries.
    def galleries
      get(FinerWorks::Gallery, "/Galleries")
    end

    # Lists images stored in My Images.
    #
    # @param [Hash] options Filtering/sorting options.
    # @option options [String] "GalleryGUID" Find images that are under a specific gallery.
    # @option options [String] "Sort" ("DESC") Sort images by upload dates. Possible values are "ASC" or "DESC".
    # @return [Array<Image>] A list of images.
    def images(options = {})
      get(FinerWorks::Image, "/Images", options)
    end

    # Lists orders.
    #
    # @param [Hash] options Filtering/sorting options.
    # @option options [String] "OrderDateTime_Start" Find orders in the time period starting at the specified date/time. Acceptable formats include "MM/DD/YYYY" or "YYYY-MM-DD".
    # @option options [String] "OrderDateTime_End" Find orders in the time period ending at the specified date/time. Acceptable formats include "MM/DD/YYYY" or "YYYY-MM-DD".
    # @option options [String] "OrderStatusID" Find orders with a specific status.
    # @option options [String] "OrderID" Find a specific order by order ID.
    # @option options [String] "Sort" ("DESC") Sort orders by ID. Possible values are "ASC" or "DESC".
    # @return [Array<Order>] A list of orders.
    def orders(options = {})
      get(FinerWorks::Order, "/Orders", options)
    end

    # Provides details for a specific order.
    #
    # @param id [Integer] Order ID number.
    # @return [Array<OrderDetails>] Order details for the given order ID.
    def order_details(id)
      get(FinerWorks::OrderDetails, "/OrderDetails", { "OrderID" => id })
    end

    # Generic GET method to request items of the specified +type+. This always returns an +Array+.
    #
    # @param type [Class] Type of objects to return.
    # @param path [String] API request path.
    # @param [Hash] options Parameters to include in the request URI.
    # @return [Array<Object>] A list of items.
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
