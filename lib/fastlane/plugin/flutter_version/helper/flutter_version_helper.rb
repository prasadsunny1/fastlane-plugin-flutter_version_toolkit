require 'yaml'

module Fastlane
  module Helper
    class FlutterVersionHelper
      def self.read_version_from_pubspec
        pubspec_path = 'pubspec.yaml'
        
        # Check if pubspec.yaml exists
        unless File.exist?(pubspec_path)
          UI.user_error!("Could not find pubspec.yaml in current directory")
          return nil
        end

        begin
          # Read and parse pubspec.yaml
          pubspec = YAML.load_file(pubspec_path)
          
          version_name = pubspec['version']&.split('+')&.first
          build_number = pubspec['version']&.split('+')&.last

          if version_name.nil? || build_number.nil?
            UI.user_error!("Could not find version information in pubspec.yaml")
            return nil
          end

          Fastlane::FlutterVersion::VersionInfo.new(version_name, build_number)
        rescue => e
          UI.error("Error reading pubspec.yaml: #{e.message}")
          return nil
        end
      end
    end
  end
end 