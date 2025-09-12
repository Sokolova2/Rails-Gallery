# frozen_string_literal: true

class UpdateLanguagesController < ApplicationController
  AVAILABLE_LOCALE = %w[en ru uk].freeze

  def update
    language = params[:language]

    current_user.update(language: language) if AVAILABLE_LOCALE.include?(language)
    redirect_back fallback_location: categories_path
  end
end
