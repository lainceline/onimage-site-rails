module Helpers
  def parse_json(object=response.body)
    JSON.parse object, symbolize_names: true
  end
end