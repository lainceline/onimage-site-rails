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
    let(:image) { FactoryGirl.create(:image) }

    before { get :show, { :id => image.id } }

    it "makes a successful http request" do
      expect(response).to be_success
    end

    describe "it returns an image" do
      subject(:image_response) { parse_json[:image] }
      specify "with the passed in id" do
        expect(image_response[:id]).to eq image.id
      end
      specify "with an uploaded filename" do
        expect(image_response[:uploaded_filename]).not_to be_nil
      end
      specify "with an original filename" do
        expect(image_response[:original_filename]).not_to be_nil
      end
    end

  end

  describe "#create" do
    it "makes a successful http request" do
      post :create, { :original_filename => 'foo.jpg', :title => 'foo' }
      expect(response.status).to eq 201
    end

    it "returns a failure code if the image was not created" do
      post :create
      expect(response.status).to eq 400
    end
  end

  describe "#destroy" do
    subject(:image) { FactoryGirl.create(:image) }
    it "makes a successful http request" do
      delete :destroy, { :id => image.id }
      expect(response.status).to eq 200
    end

    it "deletes the specified image" do
      delete :destroy, { :id => image.id }
      expect { Image.find(image.id) }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
