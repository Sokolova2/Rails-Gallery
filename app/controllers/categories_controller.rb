# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]
  before_action :set_categories, only: %i[index my_categories subscriptions]
  before_action :authenticate_user!

  def index; end

  def show
    @image = @category.images.page(params[:page]).per(10)
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to @category
    else
      category_save
    end
  end

  def update
    @category.update(category_params)
  end

  def my_categories; end

  def subscriptions; end

  def destroy
    @category.destroy
    redirect_to my_categories_categories_path
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name)
  end

  # TODO: change method name to set_categories
  def set_categories
    @categories = Category.page(params[:page]).per(20)
  end

  def category_save
    set_flash_message
    redirect_to categories_path
  end

  def set_flash_message
    if @category.errors.added?(:category, :blank)
      flash[:blank_name] = t('message-category-must-be-present')
    elsif @category.errors.added?(:category, :taken)
      flash[:duplicate_name] = t('message-category-already-exist')
    else
      flash[:alert] = @category.errors.full_messages.to_sentence
    end
  end
end
