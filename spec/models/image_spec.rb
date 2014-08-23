require 'rails_helper'

describe Image do

  before { @image = create(:image) }
  subject(:image) { @image }

  it "should have a valid factory" do
    expect(FactoryGirl.create(:image)).to be_valid
  end

  context "should be invalid" do
    it "without a title" do
      image.title = nil

      expect(image).not_to be_valid
    end

    it "without an uploaded filename" do
      image.uploaded_filename = nil

      expect(image).not_to be_valid
    end

    it "without an original filename" do
      image.original_filename = nil

      expect(image).not_to be_valid
    end
  end

  it "should know how many tags it has" do
    image = create(:image_with_tags)
    expect(image.tags.count).to eq image.num_tags
  end

  it "should be able to generate a random filename for itself" do
    expect(image.randomize_filename).not_to eq image.original_filename
  end

end
