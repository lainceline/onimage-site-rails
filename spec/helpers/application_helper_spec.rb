require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do

  describe "#json" do
    xit "should render the passed object as json" do
      foo = instance_double('Foo', :id => 5)
      foo_json = helper.json(foo)
      expect(foo.json[:id]).to eq 5
    end
  end
end