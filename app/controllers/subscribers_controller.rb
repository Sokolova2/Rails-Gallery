# frozen_string_literal: true

class SubscribersController < ApplicationController
  before_action :set_category, only: %i[create destroy]

  def create
    Subscriber.create(user_id: current_user.id, category_id: @category.id) unless @category.subscribed?(current_user)

    redirect_to categories_path
  end

  def destroy
    if @category.subscribed?(current_user)
      Subscriber.find_by(user_id: current_user.id, category_id: @category.id)&.destroy
    end

    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end
