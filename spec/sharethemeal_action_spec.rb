describe Fastlane::Actions::SharethemealAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The sharethemeal plugin is working!")

      Fastlane::Actions::SharethemealAction.run(nil)
    end
  end
end
