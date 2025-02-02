require 'fastlane/action'
require_relative '../helper/flutter_version_toolkit_helper'

module Fastlane
  module Actions
    class FlutterVersionToolkitAction < Action
      def self.run(params)
        UI.message("The flutter_version_toolkit plugin is working!")
        
        version_info = Helper::FlutterVersionHelper.read_version_from_pubspec
        if version_info.nil?
          UI.user_error!("Failed to fetch version information from pubspec.yaml")
        else
          UI.message("Version Name: #{version_info.version_name}")
          UI.message("Build Number: #{version_info.build_number}")
        end
      end

      def self.description
        "A tool that help get version name and number from pubspec.yaml file in a flutter project"
      end

      def self.authors
        ["Sanni Prasad"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ".."
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "FLUTTER_VERSION_TOOLKIT_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
