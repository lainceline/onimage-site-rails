require 'rails_helper'

describe ImagesController do

  describe "main layout" do

    it "should have the set site title" do
      #ApplicationController.any_instance.stub(:site_title).and_return('Test')
      visit '/images'
      expect(page).to have_content('argh')
    end

  end
end
