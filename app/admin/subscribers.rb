# frozen_string_literal: true

ActiveAdmin.register Subscriber do
  menu priority: 1, label: proc { I18n.t("subscriber") }
  permit_params :category_id, :user_id
  load Rails.root.join('app/admin/actions_item.rb')

  add_default_action_items_for(Subscriber)
end
