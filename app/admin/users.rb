# frozen_string_literal: true

ActiveAdmin.register User do
  menu priority: 1, label: proc { I18n.t("user") }
  actions :all, except: [:create, :new, :update, :edit]

  controller do
    def find_resource
      User.find(params[:id])
    end
  end

  action_item :custom_destroy, only: :show do
    button_to "Удалить User", admin_user_path(resource),
              method: :delete,
              form: {data: { turbo: false } },
              data: { confirm: "Точно удалить?" },
              class: "delete_button"
  end

  load Rails.root.join('app/admin/actions_item.rb')

  add_default_action_items_for(User)
end

