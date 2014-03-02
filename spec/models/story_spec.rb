require 'spec_helper'

describe Story do
  let(:user) { create :user }
  let(:story) { create :story }

  describe 'Favoritable' do
    before { story.favorite_for user }
    subject { user }
    its(:favorite_stories){ should include story }

    context 'unfavoriting stories' do
      before { story.unfavorite_for user }
      its(:favorite_stories) { should be_empty }
    end
  end
end
