# frozen_string_literal: true

ActiveAdmin.register Image do
  menu priority: 1, label: proc { I18n.t('image') }
  permit_params :category_id, :image

  controller do
    def find_resource
      Image.find(params[:id])
    end
  end

  load Rails.root.join('app/admin/actions_item.rb')

  action_items(Image)
end
