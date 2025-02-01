require 'fastlane/plugin/flutter_version_toolkit/version'

module Fastlane
  module FlutterVersionToolkit
    # Return all .rb files inside the "actions" and "helper" directory
    def self.all_classes
      Dir[File.expand_path('**/{actions,helper}/*.rb', File.dirname(__FILE__))]
    end

    # Add method to read version from pubspec
    def self.read_version_from_pubspec
      Helper::FlutterVersionHelper.read_version_from_pubspec
    end
  end
end

# By default we want to import all available actions and helpers
# A plugin can contain any number of actions and plugins
Fastlane::FlutterVersionToolkit.all_classes.each do |current|
  require current
end
