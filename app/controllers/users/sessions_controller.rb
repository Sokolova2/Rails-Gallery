# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    prepend_before_action :check_captcha, only: [:create]

    def destroy
      UserAction.create(user: current_user, action_type: "sign out", url: request.original_url)
      super
    end

    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

    def after_sign_in_path_for(resource_or_scope)
      UserAction.create(user: resource_or_scope, action_type: "sign in", url: request.original_url)
      stored_location_for(resource_or_scope) || categories_path
    end

    private

    def check_captcha
      return if verify_recaptcha(model: resource)
      # TODO: move to yml and use t()
      flash.now[:alert] = 'CAPTCHA failed. Please try again.'
      self.resource = resource_class.new(sign_in_params)
      redirect_to new_user_session_path
    end
  end
end
