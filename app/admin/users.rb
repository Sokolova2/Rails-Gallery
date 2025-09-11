# frozen_string_literal: true

ActiveAdmin.register User do
  menu priority: 1, label: proc { I18n.t('user') }
  actions :all, except: %i[create new update edit]

  controller do
    def find_resource
      User.find(params[:id])
    end
  end

  load Rails.root.join('app/admin/actions_item.rb')

  action_items(User)
end
