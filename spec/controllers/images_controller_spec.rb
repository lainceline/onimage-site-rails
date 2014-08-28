require 'rails_helper'

describe ImagesController do

  describe "#index" do
    it "returns all images as json" do

      3.times do
        FactoryGirl.create(:image)
      end

      get :index

      expect(response).to be_success
      images = JSON.parse(response.body, symbolize_names: true)[:images]
      expect(images.first).to have_key(:id)
      expect(images.size).to eq 3
    end
  end

  describe "#show" do
    it "returns the image with the passed in id" do
      image = FactoryGirl.create(:image)

      get :show, { :id => image.id }

      expect(response).to be_success
      image_response = JSON.parse(response.body, symbolize_names: true)
      expect(image_response[:image][:id]).to eq image.id
    end
  end
end
