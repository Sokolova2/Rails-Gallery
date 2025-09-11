# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Users
  before_action :set_locale

  def set_locale
    I18n.locale = if user_signed_in?
                    I18n.locale = current_user.language
                  else
                    I18n.default_locale
                  end
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
  end
end
