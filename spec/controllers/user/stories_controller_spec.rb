require 'spec_helper'

describe User::StoriesController do
  let(:user) { build_stubbed :user }
  let(:story) { build_stubbed :story }
  before { User.stub find: user }

  describe '#index' do

    it 'displays favorite stories' do
      user.stub stories: [story]
      get :index, user_id: user.id
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'write a new story for a user' do
      post :create,
        user_id: user.id,
        story: { body: 'Mr. Bubble Head' },
        format: :json
      expect(response).to be_success
    end
  end
end
