# frozen_string_literal: true

ActiveAdmin.register Category do
  menu priority: 1, label: proc { I18n.t("category") }
  permit_params :category_name, :user_id

  controller do
    def find_resource
      Category.friendly.find(params[:id])
    end
  end

  load Rails.root.join('app/admin/actions_item.rb')

  add_default_action_items_for(Category)
end
