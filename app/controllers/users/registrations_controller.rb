# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # FIXME: here
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name avatar language])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name avatar language])
    end

    def after_sign_up_path_for(resource_or_scope)
      UserAction.create(user: resource_or_scope, action_type: "sign in", url: request.original_url)
      stored_location_for(resource_or_scope) || categories_path
    end

    def after_inactive_sign_up_path_for(resource_or_scope)
      UserAction.create(user: resource_or_scope, action_type: "sign in", url: request.original_url)
      stored_location_for(resource_or_scope) || categories_path
    end

    def after_update_path_for(resource)
      edit_user_registration_path(resource)
    end

    def update_resource(resource, params)
      if resource.encrypted_password.blank?
        resource.update_without_password(account_update_params.except(:current_password))
      end
      if params[:password].present? && params[:password_confirmation].present?
        resource.update_with_password(account_update_params)
      else
        resource.update_without_password(account_update_params.except(:current_password))
      end
    end
  end
end
