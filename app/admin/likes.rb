# frozen_string_literal: true

ActiveAdmin.register Like do
  menu priority: 1, label: proc { I18n.t('like') }
  permit_params :image_id, :user_id, :category_id

  actions :all, except: %i[update edit]

  load Rails.root.join('app/admin/actions_item.rb')

  action_items(Like)
end
