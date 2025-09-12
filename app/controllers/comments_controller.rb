# frozen_string_literal: true

class CommentsController < ApplicationController
  include ApplicationHelper

  before_action :set_category, only: %i[create]
  before_action :set_image, only: %i[create]

  def create
    Comment.create(category_id: @category.id, user_id: current_user.id, image_id: @image.id, comment: params[:comment])
    add_user_active(current_user, 'add comment')
    redirect_to category_image_path(@category, @image)
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def set_image
    @image = Image.find(params[:image_id])
  end
end
