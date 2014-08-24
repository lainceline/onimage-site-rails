require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe '#index' do
    it 'should return all users as json' do
      for i in 0..2
        create(:user)
      end
      get :index
      expect(response).to be_success
      users = JSON.parse(response.body, symbolize_names: true)
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
end
