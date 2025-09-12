# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    include ApplicationHelper

    def google_oauth2
      user = User.from_omniauth(auth, locale_from_header || params[:lang])
      hangle_oauth_user(user)
    end

    protected

    def after_omniauth_failure_path_for(_scope)
      new_user_session_path
    end

    def after_sign_in_path_for(resource_or_scope)
      add_user_active(resource_or_scope, 'sign_in')
      stored_location_for(resource_or_scope) || categories_path
    end

    private

    def auth
      @auth ||= request.env['omniauth.auth']
    end

    def hangle_oauth_user(user)
      if user.present?
        sign_out_all_scopes
        flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect user, event: :authentication
      else
        flash[:alert] =
          t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
        redirect_to new_user_session_path
      end
    end
  end
end
