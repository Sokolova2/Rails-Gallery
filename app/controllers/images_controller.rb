class ImagesController < ApplicationController
  def show
    @images = Image.all
  end

  def create
    @category = Category.find(params[:category_id])
    @images = @category.images.create(image_params)

    if @images.save
      redirect_to @category, notice: 'Image was successfully created.'
    else
      redirect_to @category, notice: 'Something went wrong.'
    end
  end

  private

  def image_params
    params.require(:image).permit(:images)
  end
end
