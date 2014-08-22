require 'rails_helper'

describe Image do
  it "should be invalid without any of its properties" do
    image = Image.new

    expect(image).not_to be_valid
  end

  it "should be valid when it has all its properties" do
    image = Image.new

    image.uploaded_filename = '324234.jpg'
    image.original_filename = 'foo.jpg'
    image.title = 'foo'

    expect(image).to be_valid
  end
end
