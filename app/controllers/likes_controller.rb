# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_image, only: %i[create destroy]

  def create
    unless @image.liked?(current_user)
      Like.create(category_id: @category.id, user_id: current_user.id, image_id: @image.id)
      UserAction.create(user: current_user, action_type: "add like", url: request.original_url)
    end

    redirect_to category_image_path(@category, @image)
  end

  def destroy
    if @image.liked?(current_user)
      like = Like.find_by(category_id: @category.id, user_id: current_user.id, image_id: @image.id)
      like&.destroy
      UserAction.create(user: current_user, action_type: "delete like", url: request.original_url)
    end

    redirect_to category_image_path(@category, @image)
  end

  private

  # TODO: move to another method
  def set_image
    @category = Category.friendly.find(params[:category_id])
    @image = @category.images.find(params[:image_id])
  end
end
