require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  context "it should return json" do
    it "of all users" do
      for i in 0..2
        create(:user)
      end
      get '/users'
      expect(response).to be_success
      users = JSON.parse(response.body, symbolize_names: true)
      expect(users.count).to eq 3
    end
  end
end
