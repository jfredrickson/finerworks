require 'time'

module FinerWorks
  module Utilities
    module_function

    # Parse ISO 8601 time strings from the FinerWorks Web API. This function takes into consideration the fact that
    # the FinerWorks API does not specify a time zone, but appears to use US Central Time.
    def parse_api_time(time_string)
      Time.parse(time_string + "-06:00")
    end
  end
end
