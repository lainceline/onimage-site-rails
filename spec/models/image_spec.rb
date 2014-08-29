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

    xit "without an uploaded filename" do
      image.uploaded_filename = nil
      expect(image).not_to be_valid
    end

    it "without an original filename" do
      image.original_filename = nil
      expect(image).not_to be_valid
    end
  end

  context "should have an association with" do
    it "its tags" do
      image = create(:image_with_tags)
      expect(image.tags).not_to be_nil
      expect(image.tags[0]).to be_a(Tag)
    end

    it "its comments" do
      image = create(:image_with_comments)
      expect(image.comments).not_to be_nil
      expect(image.comments[0]).to be_a(Comment)
    end
  end

  it "should be able to generate a random filename for itself" do
    expect(image.randomize_filename).not_to eq image.original_filename
  end

end
