class CategoriesController < ApplicationController
  before_action :set_categories, only: %i[show]

  def index
    @categories = Category.all
  end

  def show
  end

  def create
    @category = Category.new(categories_params)
    @category.user = current_user

    if @category.save
      redirect_to @category, notice: "Category was successfully created."
    else
      redirect_to root_path, notice: "Category was not created."
    end
  end

  private

  def set_categories
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:category).permit(:category_name, :image)
  end
end
