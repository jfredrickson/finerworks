require 'time'

module FinerWorks
  class Cart < Hashie::Trash
    property :guid, from: "CartGUID"
    property :expiration, from: "CartExpiration", transform_with: lambda { |d| Time.parse(d) }
  end
end
