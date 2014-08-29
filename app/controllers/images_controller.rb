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
    image = Image.new(image_params)
    if image.save
      render json: image, status: :created
    else
      render json: image.errors, status: 422
    end
  end

  def destroy
    Image.destroy(params[:id])
    head 204
  end

  private
  def image_params
    params.permit(:original_filename, :title)
  end

end
