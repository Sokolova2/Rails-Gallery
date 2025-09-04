# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[create]

  def create
    Comment.create(category_id: @category.id, user_id: current_user.id, image_id: @image.id, comment: params[:comment])
    UserAction.create(user: current_user, action_type: "add comment", url: request.original_url)

    redirect_to category_image_path(@category, @image)
    UserAction.create(user: current_user, action_type: "add comment", url: request.original_url)
  end

  private

  def set_comment
    @category = Category.friendly.find(params[:category_id])
    @image = Image.find(params[:image_id])
  end
end
