require 'fastlane/action'
require_relative '../helper/flutter_version_toolkit_helper'

module Fastlane
  module Actions
    class FlutterVersionToolkitAction < Action
      def self.run(params)
        version_info = Fastlane::FlutterVersionToolkit.read_version_from_pubspec
        UI.user_error!("Could not retrieve version info from pubspec.yaml") if version_info.nil?
        UI.message("Version Info: #{version_info.version_name} (build #{version_info.build_number})")
        return version_info
      end

      def self.description
        "A tool that help get version name and number from pubspec.yaml file in a flutter project"
      end

      def self.authors
        ["Sanni Prasad"]
      end

      def self.return_value
        "Returns a VersionInfo object with version name and build number, "
      end

      def self.details
        # Optional:
        "Hello world"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :pubspec_location,
            env_name: 'PUBSPEC_LOCATION',
            description: 'The location of pubspec.yml',
            optional: true,
            type: String,
            default_value: '../pubspec.yaml'
          ),
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
