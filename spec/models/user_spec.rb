require 'rails_helper'

RSpec.describe User, :type => :model do

  before(:each) do
    @user = create(:user)
  end

  it "should have a valid factory" do
    expect(@user).to be_valid
  end

  it "should be invalid without a name" do
    @user.name = nil
    expect(@user).not_to be_valid
  end

  it "should be invalid without an email" do
    @user.email = nil
    expect(@user).not_to be_valid
  end

  it "should have an association with its images" do
    user = create(:user_with_images)
    expect(user.images).not_to be_empty
    expect(user.images[0]).to be_an(Image)
  end

end
