require 'rails_helper'

RSpec.describe Comment, :type => :model do

  before { @comment = create(:comment_with_user_and_image) }
  subject(:comment) { @comment }

  it 'should have a valid factory' do
    expect(comment).to be_valid
  end

  context "should be invalid" do
    it "without any text" do
      comment.text = ''
      expect(comment).not_to be_valid
    end

    it "without a user" do
      comment.user = nil
      expect(comment).not_to be_valid
    end

    it "without an image" do
      comment.image = nil
      expect(comment).not_to be_valid
    end
  end

end
