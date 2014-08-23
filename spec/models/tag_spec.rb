require 'rails_helper'

RSpec.describe Tag, :type => :model do

  it "should be able to list its images" do

    tag = create(:tag_with_image)
    expect(tag.images.count).to eq tag.num_images

  end

end
