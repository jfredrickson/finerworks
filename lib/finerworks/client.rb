require 'finerworks/request'
require 'finerworks/account'
require 'finerworks/gallery'

module FinerWorks
  class Client
    attr_accessor :account_api_key

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    def account
      result = FinerWorks::Request.get(self, "/Account")
      FinerWorks::Account.new(result)
    end

    def galleries
      result = FinerWorks::Request.get(self, "/Galleries")
      galleries = []
      result.each do |g|
        galleries << FinerWorks::Gallery.new(g)
      end
      galleries
    end

    def update_account(account)
      result = FinerWorks::Request.post(self, "/Account", {
        query: {
          "AccountApiKey": account_api_key,
          "AccountUsername": account.username,
          "AccountUpdate_Info": {
            "AccountEmail": account.email,
            "AccountFirstName": account.first_name,
            "AccountMiddleName": account.middle_name,
            "AccountLastName": account.last_name,
            "AccountPhone": account.phone,
            "AccountBio": account.bio,
            "AccountTitle": account.title
          }
        }
      })
    end
  end
end
