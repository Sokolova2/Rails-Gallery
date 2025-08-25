# frozen_string_literal: true

class UpdateLanguagesController < ApplicationController
  def update
    language = params[:language]

    case language
    when 'en'
      User.where(id: current_user.id).update_all(language: 'en')
    when 'ru'
      User.where(id: current_user.id).update_all(language: 'ru')
    when 'uk'
      User.where(id: current_user.id).update_all(language: 'uk')
    end
    redirect_back fallback_location: categories_path
  end
end
