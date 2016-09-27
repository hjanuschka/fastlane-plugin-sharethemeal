module Fastlane
  module Helper
    class SharethemealHelper
      # class methods that you define here become available in your action
      # as `Helper::SharethemealHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the sharethemeal plugin helper!")
      end
    end
  end
end
