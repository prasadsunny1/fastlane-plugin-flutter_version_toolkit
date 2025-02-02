# flutter_version_toolkit plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-flutter_version_toolkit)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-flutter_version_toolkit`, add it to your project by running:

```bash
fastlane add_plugin flutter_version_toolkit
```

## Description

This Fastlane plugin extracts version information from your Flutter project's pubspec.yaml file. It uses an action (defined in flutter_version_toolkit_action.rb) to read the version name and build number, enabling you to integrate version control seamlessly into your deployment process.

## About flutter_version_toolkit

A Fastlane plugin that helps extract version information from your Flutter project's pubspec.yaml file. It provides actions to read the version name and build number, making it easier to integrate version control into your deployment process.

## Usage

In your Fastfile, invoke the plugin as follows:

The plugin offers the following actions:

### get_flutter_version_name

Retrieves the version name from your pubspec.yaml file.

```ruby
version_name = get_flutter_version_name(
  pubspec_path: "./pubspec.yaml" # Optional, defaults to project root
)
puts "Version name: #{version_name}"
```

### get_flutter_version_code

Retrieves the version code (build number) from your pubspec.yaml file.

```ruby
version_code = get_flutter_version_code(
  pubspec_path: "./pubspec.yaml" # Optional, defaults to project root
)
puts "Version code: #{version_code}"
```

## Example Fastfile

An example Fastfile to use the plugin in an Android deployment lane:

```ruby
default_platform(:android)

platform :android do
  desc "Deploy Android app to Play Store"
  lane :deploy do
    # Retrieve version information from Flutter's pubspec.yaml
    version_name = get_flutter_version_name
    version_code = get_flutter_version_code
    
    # Use these versions in your build configuration
    gradle(
      task: 'assemble',
      build_type: 'Release',
      properties: {
        "versionName" => version_name,
        "versionCode" => version_code
      }
    )
    
    upload_to_play_store(
      track: 'internal',
      version_name: version_name,
      version_code: version_code
    )
  end
end
```

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

**Note to author:** Please set up a sample project to make it easy for users to explore what your plugin does. Provide everything that is necessary to try out the plugin in this project (including a sample Xcode/Android project if necessary)

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
