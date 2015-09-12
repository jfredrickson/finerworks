require 'finerworks/request'

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
    end

    def galleries
      result = FinerWorks::Request.get(self, "/Galleries")
    end
  end
end
