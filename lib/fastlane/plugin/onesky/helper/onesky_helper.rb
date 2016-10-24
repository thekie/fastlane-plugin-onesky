module Fastlane
  module Helper
    class OneskyHelper
      # class methods that you define here become available in your action
      # as `Helper::OneskyHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the onesky plugin helper!")
      end
    end
  end
end
