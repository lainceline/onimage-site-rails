require 'rails_helper'

RSpec.describe Comment, :type => :model do

  it "should be invalid without any text" do
    comment = Comment.new
    expect(comment).not_to be_valid
  end

  it "should be invalid without a user" do
    comment = Comment.new
    comment.text = "This image rocks"
    expect(comment).not_to be_valid
  end
end
