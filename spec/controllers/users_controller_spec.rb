require 'spec_helper'

describe UsersController do
  context 'POST#create' do
    it 'should create a user' do
      expect {
        xhr :post, :create, user: { email: 'foo@bar.com' }
        expect(response).to be_success
      }.to change { User.count }.by(1)
    end
  end

  context 'GET#show' do
    let(:user) { create :user }

    it 'should return the user' do
      xhr :get, :show, id: user.id
      expect(response).to be_success
    end
  end
end
