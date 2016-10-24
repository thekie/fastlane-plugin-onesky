module Fastlane
  module Actions
    class OneskyAction < Action
      def self.run(params)
        UI.message("The onesky plugin is working!")
      end

      def self.description
        "Helps to update the translations of your app using the OneSky service."
      end

      def self.authors
        ["Daniel Kiedrowski"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Provides actions to upload the base language translation file to OneSky and to import the current translations back into your app."
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "ONESKY_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
