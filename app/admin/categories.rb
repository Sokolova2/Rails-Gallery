# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :category_name, :user_id

  controller do
    def find_resource
      Category.friendly.find(params[:id])
    end
  end

  config.clear_action_items!

  action_item :new, only: :index do
    link_to "New Category", new_resource_path
  end

  action_item :edit, only: :show do
    link_to "Edit Category", edit_resource_path(resource)
  end

  action_item :custom_destroy, only: :show do
    button_to "Удалить", admin_category_path(resource),
            method: :delete,
            form: {data: { turbo: false } },
            data: { confirm: "Точно удалить?" },
            class: "delete_button"
  end
end
