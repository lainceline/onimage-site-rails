require 'rails_helper'

RSpec.describe Comment, :type => :model do

  before(:each) do
    @comment = create(:comment_with_user_and_image)
  end

  it "should be invalid without any text" do
    @comment.text = ''
    expect(@comment).not_to be_valid
  end

  it "should be invalid without a user" do
    @comment.user = nil
    expect(@comment).not_to be_valid
  end

  it "should be invalid without an image" do
    @comment.image = nil
    expect(@comment).not_to be_valid
  end

end
