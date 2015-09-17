require 'finerworks/request'
require 'finerworks/account'
require 'finerworks/print'
require 'finerworks/gallery'
require 'finerworks/image'

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
      FinerWorks::Account.new(result)
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

    # Generic GET method to request items of the specified +type+.
    def get(type, path, options = {})
      response = FinerWorks::Request.get(self, path, options)
      response = response.kind_of?(Array) ? response : [response]
      results = []
      response.each do |r|
        results << type.new(r)
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
