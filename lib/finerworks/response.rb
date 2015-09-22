require 'json'

module FinerWorks
  class Response
    attr_accessor :body, :json, :code, :message

    def initialize(http_response)
      @code = http_response.code
      @message = http_response.message
      @body = http_response.body
      @json = JSON.parse(@body) if http_response.is_a? Net::HTTPOK
    end
  end
end
