# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :image, only: %i[show]
  before_action :authenticate_user!

  def show
    @likes = Like.all
  end

  def create
    @category = Category.find(params[:category_id])
    @images = @category.images.create(image_params)

    if @images.save
      redirect_to @category
    else
      redirect_to @category
    end
  end

  private

  def image
    @category = Category.find(params[:category_id])
    @image = @category.images.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
