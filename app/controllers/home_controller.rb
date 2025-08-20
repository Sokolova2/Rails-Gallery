# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @category = Category.all
    @images = Image.all
  end
end
