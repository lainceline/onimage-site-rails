require 'rails_helper'

describe ImagesController do

  describe "#index" do
    before do
      3.times { FactoryGirl.create(:image) }
      get :index
    end

    it "makes a successful http request" do
      expect(response).to be_success
    end

    describe "it returns" do
      subject(:images) { parse_json[:images] }

      specify "images as json" do
        expect(images.first).to have_key(:id)
      end

      specify  "all of the images" do
        expect(images.size).to eq 3
      end
    end
  end

  describe "#show" do
    before do
      @image = FactoryGirl.create(:image)
      get :show, { :id => @image.id }
    end

    it "makes a successful http request" do
      expect(response).to be_success
    end

    describe "it returns an image" do
      subject(:image_response) { parse_json[:image] }
      specify "with the passed in id" do
        expect(image_response[:id]).to eq @image.id
      end
      specify "with an uploaded filename" do
        expect(image_response[:uploaded_filename]).not_to be_nil
      end
      specify "with an original filename" do
        expect(image_response[:original_filename]).not_to be_nil
      end
    end

  end
end
