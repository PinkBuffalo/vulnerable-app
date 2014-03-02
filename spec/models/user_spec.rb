require 'spec_helper'

describe User do
  let(:user) { create :user }
  let(:story) { create :story }

  it 'can write stories' do
    expect {
      user.stories.create body: 'I hacked the government'
    }.to change{ user.stories.count }.by(1)
  end
end
