# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :image, only: %i[show]
  before_action :authenticate_user!

  def show
    @likes = Like.where(image_id: @image.id)
    @comments = Comment.where(image_id: @image.id).order(created_at: :desc)
  end

  def create
    @category = Category.friendly.find(params[:category_id])
    @images = @category.images.create(image_params)

    flash[:alert] = @images.errors.full_messages.to_sentence unless @images.save
    redirect_to @category
  end

  private

  def image
    @category = Category.friendly.find(params[:category_id])
    @image = @category.images.find(params[:id])
  end

  def image_params
    params.expect(image: [:image])
  end
end
