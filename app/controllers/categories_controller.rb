# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy]
  before_action :categories_all, only: %i[index my_categories]
  before_action :authenticate_user!

  def index
  end

  def show
    @image = @category.images.page(params[:page]).per(5)
  end

  def create
    @category = Category.new(categories_params)
    @category.user = current_user

    if @category.save
      redirect_to @category
    else
      if @category.errors.added?(:category, :blank)
        flash[:blank_name] = "Category name must be present"
      elsif @category.errors.added?(:category, :taken)
        flash[:duplicate_name] = "A category with this name already exists"
      else
        flash[:alert] = @category.errors.full_messages.to_sentence
      end

      redirect_to categories_path
    end
  end

  def my_categories
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def categories_params
    params.require(:category).permit(:category_name, :image)
  end

  def categories_all
    @categories = Category.page(params[:page]).per(5)
  end
end
