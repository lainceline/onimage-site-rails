require 'rails_helper'

RSpec.describe 'JSONHelper', :type => :helper do
  describe "#json" do
    it "should have response.body as a default argument" do
      allow(response).to receive(:body) { '{"foo": null}'}
      expect(parse_json).to have_key(:foo)
    end

    it "should parse the passed json" do
      json = '{"foo": {"bar": "baz"}}'
      parsed = parse_json(json)
      expect(parsed).to have_key(:foo)
    end
  end
end