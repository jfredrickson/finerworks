require 'uri'
require 'net/http'

module FinerWorks
  class Request
    BASE_URL = "http://api.finerworks.com/api"
    TIME_ZONE_ID = "UTC"

    def self.get(client, path, options = {})
      path.prepend("/") if !path.start_with?("/")
      params = ""
      options.each do |option|
        params = params + "&#{option[0].to_s}=#{option[1]}"
      end
      uri = URI.parse("#{BASE_URL}#{path}?AccountApiKey=#{client.account_api_key}&TimeZoneID=#{TIME_ZONE_ID}#{params}")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      FinerWorks::Response.new(response)
    end

    def self.post(client, path, options = {})
      path.prepend("/") if !path.start_with?("/")
      uri = URI.parse("#{BASE_URL}#{path}?AccountApiKey=#{client.account_api_key}&TimeZoneID=#{TIME_ZONE_ID}")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = options.to_json
      request.content_type = "application/json"
      response = http.request(request)
      FinerWorks::Response.new(response)
    end
  end
end
