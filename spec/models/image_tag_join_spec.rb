require 'rails_helper'

RSpec.describe ImageTagJoin, :type => :model do
  it 'should be invalid if the join already exists' do
    FactoryGirl.create(:image_tag_join_dupe)
    image2 = FactoryGirl.build(:image_tag_join_dupe)
    expect(image2).to be_invalid
  end

  it 'should throw an error if trying to save a duplicate join' do
    FactoryGirl.create(:image_tag_join_dupe)
    create_a_dupe = Proc.new { FactoryGirl.create(:image_tag_join_dupe) }
    expect(&create_a_dupe).to raise_error(ActiveRecord::RecordInvalid)
  end
end
