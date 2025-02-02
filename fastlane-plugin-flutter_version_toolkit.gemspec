lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/flutter_version_toolkit/version'

Gem::Specification.new do |spec|
  spec.name          = 'flutter_version_toolkit'
  spec.version       = Fastlane::FlutterVersionToolkit::VERSION
  spec.author        = 'Sanni Prasad'
  spec.email         = 'prasadsunny1@gmail.com'

  spec.summary       = 'A tool that help get version name and number from pubspec.yaml file in a flutter project'
  spec.homepage      = "https://github.com/prasadsunny1/fastlane-plugin-flutter_version_toolkit"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.required_ruby_version = '>= 2.6'

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  # spec.add_dependency 'your-dependency', '~> 1.0.0'
end
