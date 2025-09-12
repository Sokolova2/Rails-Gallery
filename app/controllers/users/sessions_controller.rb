# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    include ApplicationHelper

    prepend_before_action :check_captcha, only: %i[create]

    def destroy
      add_user_active(current_user, 'sign_out')
      super
    end

    def after_sign_out_path_for(_resource_or_scope)
      root_path
    end

    def after_sign_in_path_for(resource_or_scope)
      add_user_active(resource_or_scope, 'sign_in')
      stored_location_for(resource_or_scope) || categories_path
    end

    private

    def check_captcha
      return if verify_recaptcha(model: resource)

      flash.now[:alert] = t('captcha')
      self.resource = resource_class.new(sign_in_params)
      redirect_to new_user_session_path
    end
  end
end
