require 'spec_helper'

describe User do
  let(:user) { create :user }
  let(:story) { create :story }

  context '.stories' do
    it 'can write stories' do
      expect {
        user.stories.create body: 'I hacked the government'
      }.to change{ user.stories.count }.by(1)
    end

    it 'can favorite a story' do
      user.favorite story
      expect(user.favorite_stories).to include(story)
    end
  end
end
