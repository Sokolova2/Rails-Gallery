# frozen_string_literal: true

ActiveAdmin.register User do
  actions :all, except: [:create, :new, :update, :edit]

  controller do
    def find_resource
      User.find(params[:id])
    end
  end

  action_item :destroy, only: :show do
    link_to "Удалить пользователя", admin_user_path(resource),
            method: :delete,
            form: { data: { turbo: false } },
            data: { confirm: "Вы уверены, что хотите удалить этого пользователя?" }
  end
end

