module ApplicationHelper
  def site_title
    "Onimage - Rails"
  end

  def json(object)
    render json: object, symbolize_names: true
  end
end
