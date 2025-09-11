# frozen_string_literal: true

ActiveAdmin.setup do |config|
  config.site_title = 'Rails Gallery'
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.comments = false
  config.batch_actions = true
  config.filter_attributes = %i[encrypted_password password password_confirmation]
  config.localize_format = :long

  config.register_stylesheet 'active_admin.css'
  config.register_javascript 'active_admin.js'
end
