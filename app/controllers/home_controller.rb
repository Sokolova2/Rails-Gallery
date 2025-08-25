# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @top_images = Image
                  .select('images.*, count(distinct likes.id) as likes_count, count(distinct comments.id) as comments_count')
                  .joins(:likes, :comments)
                  .group('images.id')
                  .order('likes_count DESC, comments_count DESC')
                  .limit(5)

    @top_categories = Category
                      .select('categories.*, count(distinct likes.id) as likes_count, count(distinct comments.id) as comments_count')
                      .joins(:likes, :comments)
                      .group('categories.id')
                      .order('likes_count DESC, comments_count DESC')
                      .limit(5)
  end
end
