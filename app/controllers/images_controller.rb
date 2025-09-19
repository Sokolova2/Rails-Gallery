# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :set_category
  before_action :set_image, only: %i[show]
  before_action :authenticate_user!

  def show
    @likes = Like.where(image_id: @image.id)
    @comments = Comment.where(image_id: @image.id).order(created_at: :desc)
  end

  def create
    @images = @category.images.build(image_params)

    save_image

    redirect_to @category
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_image
    @image = @category.images.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image)
  end

  def save_image
    if @images.save
      flash[:notice] = t('success-upload-image')
    else
      flash[:alert] = @images.errors.full_messages.to_sentence
    end
  end
end
