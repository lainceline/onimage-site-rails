require 'rails_helper'

describe Image do

  before(:each) do
    @image = create(:image)
  end

  it "should be invalid without a title" do
    @image.title = nil

    expect(@image).not_to be_valid
  end

  it "should be invalid without an uploaded filename" do
    @image.uploaded_filename = nil

    expect(@image).not_to be_valid
  end

  it "should be invalid without an original filename" do
    @image.original_filename = nil

    expect(@image).not_to be_valid
  end
end
