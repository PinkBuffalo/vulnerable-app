require 'spec_helper'

module Users
  describe FavoriteStoriesController do
    let(:user) { build_stubbed :user }
    let(:story) { build_stubbed :story }
    before { User.stub find: user }

    describe '#show' do
      it 'displays favorite stories' do
        user.stub favorite_stories: [story]
        get :index, user_id: user.id, format: :json
        expect(response).to be_success
      end
    end

    describe '#create' do
      before { Story.stub find: story }
      it 'favorites a story for a user' do
        post :create, user_id: user.id, id: story.id, format: :json
        expect(response).to be_success
      end
    end

    describe '#destroy' do
      before { Story.stub find: story }
      it 'unfavorite a story for a user' do
        delete :destroy, user_id: user.id, id: story.id, format: :json
        expect(response).to be_success
      end
    end
  end
end
