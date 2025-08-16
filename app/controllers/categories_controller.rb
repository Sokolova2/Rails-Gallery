class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy]
  before_action :categories_all, only: %i[index destroy]
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def create
    @category = Category.new(categories_params)
    @category.user = current_user

    if @category.save
      redirect_to @category
    else
      redirect_to @categories
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:category).permit(:category_name, :image)
  end

  def categories_all
    @categories = Category.all
  end
end
