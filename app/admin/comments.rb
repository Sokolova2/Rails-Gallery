# frozen_string_literal: true

ActiveAdmin.register Comment, as: 'UserComment' do
  menu priority: 1, label: proc { I18n.t('comment') }
  permit_params :comment, :user_id, :image_id, :category_id

  config.clear_action_items!

  action_item :new, only: :index do
    link_to new_resource_path do
      t('new-action-item')
    end
  end

  action_item :edit, only: :show do
    link_to edit_resource_path(resource) do
      t('edit-action-item')
    end
  end

  action_item :custom_destroy, only: :show do
    unless resource == current_admin_user
      button_to t('delete-action-item'),
                admin_user_comment_path(resource),
                method: :delete,
                form: { data: { turbo: false } },
                data: { confirm: 'Точно удалить?' },
                class: 'delete_button'
    end
  end
end
