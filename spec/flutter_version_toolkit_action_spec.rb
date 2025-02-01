describe Fastlane::Actions::FlutterVersionToolkitAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The flutter_version_toolkit plugin is working!")

      Fastlane::Actions::FlutterVersionToolkitAction.run(nil)
    end
  end
end
