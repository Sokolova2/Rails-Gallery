# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :image, only: %i[show]
  before_action :authenticate_user!

  def show
    @likes = Like.where(image_id: @image.id)
    @comments = Comment.where(image_id: @image.id)
  end

  def create
    @category = Category.friendly.find(params[:category_id])
    @images = @category.images.create(image_params)

    if @images.save
      redirect_to @category
    else
      flash[:alert] = @images.errors.full_messages.to_sentence
      redirect_to @category
    end
  end

  private

  def image
    @category = Category.friendly.find(params[:category_id])
    @image = @category.images.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
