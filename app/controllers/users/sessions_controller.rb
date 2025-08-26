# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]
    prepend_before_action :check_captcha, only: [:create]
    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    def after_sign_out_path_for(_resource_or_scope)
      root_path
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || categories_path
    end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
    private

    def check_captcha
      return if verify_recaptcha(model: resource)

      flash.now[:alert] = 'CAPTCHA failed. Please try again.'
      self.resource = resource_class.new(sign_in_params)
      redirect_to new_user_session_path
    end
  end
end
