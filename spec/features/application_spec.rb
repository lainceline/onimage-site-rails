require 'rails_helper'

RSpec.describe OnimageRails do

  include ApplicationHelper

  describe 'static delivery of home page' do

    it "has the set site title" do
      visit root_path
      expect(page).to have_title(site_title)
    end

  end

end
