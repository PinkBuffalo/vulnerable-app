require 'spec_helper'

describe StoriesController do
  context 'index' do
    let(:story) { build_stubbed :story }

    it 'lists the last 50 stories found' do
      Story.stub recent: [story]
      get :index, format: :json
      expect(response).to be_success
    end
  end
end
