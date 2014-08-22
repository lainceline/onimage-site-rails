require 'rails_helper'

describe Image do
  it "should be invalid without any of its properties" do
    image = Image.new

    expect(image).not_to be_valid
  end
end
