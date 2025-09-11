# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_top_categories, only: %i[index]

  def index; end

  private

  def set_top_categories
    @top_categories = Category.order_by_likes_and_comments
  end
end
