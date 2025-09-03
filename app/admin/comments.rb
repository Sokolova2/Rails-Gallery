# frozen_string_literal: true

ActiveAdmin.register Comment, as: "UserComment" do
  menu priority: 1, label: proc { I18n.t("comment") }
  permit_params :comment, :user_id, :image_id, :category_id

  config.clear_action_items!

  action_item :new, only: :index do
    link_to "New #{resource_class.model_name}", new_resource_path
  end

  if controller.action_methods.include?('edit')
    action_item :edit, only: :show do
      link_to "Edit #{resource_class.model_name}", edit_resource_path(resource)
    end
  end

  action_item :custom_destroy, only: :show do
    unless resource == current_admin_user
      button_to "Удалить #{resource_class.model_name}",
                admin_user_comment_path(resource),
                method: :delete,
                form: { data: { turbo: false } },
                data: { confirm: "Точно удалить?" },
                class: "delete_button"
    end
  end
end
