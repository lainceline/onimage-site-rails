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
    describe "returns json" do
      context "on success" do
        before { post :create, { :original_filename => 'foo.jpg', :title => 'foo' } }
        specify "that really is json type" do
          expect(response.content_type).to eq Mime::JSON
        end
        specify "with the created object" do
          image = parse_json(response.body)[:image]
          expect(image[:original_filename]).to eq 'foo.jpg'
        end
        specify "and with the correct success code" do
          expect(response.status).to eq 201
        end
      end

      context "on failure" do
        before { post :create }
        specify "that really is json type" do
          expect(response.content_type).to eq Mime::JSON
        end
        specify "with the errors" do
          expect(parse_json(response.body)).to have_key(:title)
        end
        specify "and with an error status code" do
          expect(response.status).to eq 422
        end
      end
    end
  end

  describe "#destroy" do
    subject(:image) { FactoryGirl.create(:image) }
    it "returns the proper status code on success" do
      delete :destroy, { :id => image.id }
      expect(response.status).to eq 204
    end

    it "deletes the specified image" do
      delete :destroy, { :id => image.id }
      expect { Image.find(image.id) }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
