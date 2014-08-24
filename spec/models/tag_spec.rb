require 'rails_helper'

RSpec.describe Tag, :type => :model do

  it "should have a valid factory" do
    expect(FactoryGirl.create(:tag)).to be_valid
  end

  it "should have an association with its images" do
    tag = create(:tag_with_images)
    expect(tag.images).to_not be_nil
    expect(tag.images[0]).to be_an Image
  end

end
