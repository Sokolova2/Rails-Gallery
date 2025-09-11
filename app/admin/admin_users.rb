# frozen_string_literal: true

ActiveAdmin.register AdminUser do
  menu priority: 1, label: proc { I18n.t('admin-user') }
  permit_params :email, :password, :password_confirmation

  actions :all, except: %i[edit update]

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  load Rails.root.join('app/admin/actions_item.rb')
  action_items(AdminUser)
end
