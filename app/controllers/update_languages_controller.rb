# frozen_string_literal: true

class UpdateLanguagesController < ApplicationController
  LANGUAGE = %w[en ru uk].freeze

  def update
    language = params[:language]
    # TODO: add constant with languages, then update user language in separate method
    current_user.update(language: language) if LANGUAGE.include?(language)
    redirect_back fallback_location: categories_path
  end
end
