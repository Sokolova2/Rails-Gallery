class CommentsController < ApplicationController
  before_action :set_comment, only: %i[create]

  def create
    Comment.create(category_id: @category.id, user_id: current_user.id, image_id: @image.id, comment: params[:comment])
    redirect_to category_image_path(@category, @image)
  end

  private

  def set_comment
    @category = Category.find(params[:category_id])
    @image = Image.find(params[:image_id])
  end
end
