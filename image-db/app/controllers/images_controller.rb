class ImagesController < ApplicationController



  def index

  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save

    redirect_to image_path @image.id
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:path)
  end

end
