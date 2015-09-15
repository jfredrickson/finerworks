require 'time'

module FinerWorks
  module Utilities
    module_function

    # Parse ISO 8601 time strings from the FinerWorks Web API. This function takes into consideration the fact that
    # the FinerWorks API does not specify a time zone in its responses, yet it appears to use US Central Time.
    def parse_api_time(time_string)
      if time_string.split("T").last.split(/[+-]/).count < 2
        # If no TZ given, figure out if it's CST or CDT.
        offset = Time.parse(time_string).dst? ? "-05:00" : "-06:00"
        time_string += offset
      end
      Time.parse(time_string)
    end
  end
end
