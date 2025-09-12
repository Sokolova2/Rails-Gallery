# frozen_string_literal: true

class LikesController < ApplicationController
  include ApplicationHelper

  before_action :set_category, only: %i[create destroy]
  before_action :set_image, only: %i[create destroy]

  def create
    unless @image.liked?(current_user)
      Like.create(category_id: @category.id, user_id: current_user.id, image_id: @image.id)
      add_user_action(current_user, 'add like')
    end

    redirect_to category_image_path(@category, @image)
  end

  def destroy
    if @image.liked?(current_user)
      like = Like.find_by(category_id: @category.id, user_id: current_user.id, image_id: @image.id)
      like&.destroy
      add_user_action(current_user, 'delete like')
    end

    redirect_to category_image_path(@category, @image)
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_image
    @image = @category.images.find(params[:image_id])
  end
end
