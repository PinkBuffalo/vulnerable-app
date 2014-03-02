require 'spec_helper'

describe User::FavoriteStoriesController do
  describe '#show' do
    let(:user) { build_stubbed :user }
    let(:story) { build_stubbed :story }

    it 'displays favorite stories' do
      user.stub favorite_stories: [story]
      User.stub find: user

      get :index, user_id: user.id

      expect(response).to be_success
    end
  end
end
