require 'spec_helper'

describe User do
  let(:user) { User.create name: 'mister' }

  it 'can write stories' do
    expect {
      user.stories.create body: 'I hacked the government'
    }.to change{ user.stories.count }.by(1)
  end
end
