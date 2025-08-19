# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_image, only: %i[create destroy]

  def create
    unless @image.liked?(current_user)
      Like.create(category_id: @category.id, user_id: current_user.id, image_id: @image.id, like: 1)
    end

    redirect_to category_image_path(@category, @image)
  end

  def destroy
    if @image.liked?(current_user)
      Like.find_by(category_id: @category.id, user_id: current_user.id, image_id: @image.id)&.destroy
    end

    redirect_to category_image_path(@category, @image)
  end

  private

  def set_image
    @category = Category.find(params[:category_id])
    @image = @category.images.find(params[:image_id])
  end
end
