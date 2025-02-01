module Fastlane
  module FlutterVersion
    class VersionInfo
      attr_reader :version_name, :build_number

      def initialize(version_name, build_number)
        @version_name = version_name
        @build_number = build_number
      end
    end
  end
end 