require 'rails_helper'

RSpec.describe Tag, :type => :model do

  it "should have a valid factory" do
    expect(FactoryGirl.create(:tag)).to be_valid
  end

  it "should know how many images it has" do
    tag = create(:tag_with_images)
    expect(tag.images.count).to eq tag.num_images
  end

end
