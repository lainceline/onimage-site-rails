require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe '#index' do
    it 'should return all users as json' do
      for i in 0..2
        create(:user)
      end
      get :index
      expect(response).to be_success
      users = parse_json[:users]
      expect(users.count).to eq 3
    end
  end

  describe '#show' do
    it 'should return the user with the passed in id' do
      user = create(:user)
      get :show, {:id => user.id}
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'should create the user from the attributes passed in' do
      get :create, {:name => 'James', :email => 'foo@bar.com'}
      expect(response).to be_success
      user_response = parse_json
      expect(user_response[:id]).to_not be_nil
    end
  end
end
