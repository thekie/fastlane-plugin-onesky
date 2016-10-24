describe Fastlane::Actions::OneskyAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The onesky plugin is working!")

      Fastlane::Actions::OneskyAction.run(nil)
    end
  end
end
