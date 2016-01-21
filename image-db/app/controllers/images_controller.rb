class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]




  def index
    @images = Image.all
    binding.pry
  end

  def new
    @image = Image.new
  end

  def create
    if(!user_signed_in?)
      redirect_to root, :flash => { :error=> "You must be logged in to do that." }
    end
    @image = Image.new
    uploader = ImageUploader.new
    uploader.store!(image_params[:image])
    @image.path = uploader.file.filename

    @image.user_id = current_user.id
    @image.save

    redirect_to image_path @image.id
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end

end
