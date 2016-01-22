class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]




  def index
    @images = Image.all
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

  def edit
    @image = Image.find(params[:id])
    @tags = @image.tags
  end

  def add_tag
    @image = Image.find(params[:id])
    tagname = params[:tag]
    if(tagname.nil? == false && tagname != "")
      data = Tag.where(name: tagname)
      if(data.count == 0)
        @tag = Tag.new
        @tag.name = tagname
        @tag.save
      else
        @tag = data[0]
      end

      if(@image.tags.where(id: @tag.id).count != 0)
        flash[:alert] = @tag.errors.full_messages.join(". ") + "Image already has the tag #{tagname}."
      else
        @image.tags << @tag
      end
    end

    redirect_to edit_image_path @image.id
  end

  def remove_tag
    binding.pry
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end

end
