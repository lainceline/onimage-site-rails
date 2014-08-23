require 'rails_helper'

RSpec.describe Tag, :type => :model do

  it "should know how many tags it has" do

    tag = create(:tag_with_images)
    expect(tag.images.count).to eq tag.num_images

  end

end
