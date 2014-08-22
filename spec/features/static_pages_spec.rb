require 'rails_helper'

RSpec.describe OnimageRails do

  describe 'static delivery of home page' do
    it "has the set site title" do
      visit root_path
      expect(page).to have_title('test')
    end
  end

end
