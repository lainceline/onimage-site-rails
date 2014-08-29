class ImagesController < ApplicationController

  def index
    @images = Image.all
    render json: @images
  end

  def show
    @image = Image.find(params[:id])
    render json: @image
  end

  def create
    @image = Image.new(image_params)
    if @image.valid?
      @image.save
      render json: 'success', status: :created
    else
      render json: 'failure', status: 400
    end
  end

  private
  def image_params
    params.permit(:original_filename, :title)
  end

end
