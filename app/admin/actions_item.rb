# frozen_string_literal: true

def create_object
  return unless controller.action_methods.include?('new')

  action_item :new, only: :index do
    link_to new_resource_path do
      t('new-action-item')
    end
  end
end

def edit_object
  return unless controller.action_methods.include?('edit')

  action_item :edit, only: :show do
    link_to edit_resource_path(resource) do
      t('edit-action-item')
    end
  end
end

def delete_object(resource_class)
  action_item :custom_destroy, only: :show do
    unless resource == current_admin_user
      button_to t('delete-action-item'),
                send("admin_#{resource_class.name.underscore}_path", resource),
                method: :delete,
                form: { data: { turbo: false } },
                data: { confirm: 'Точно удалить?' },
                class: 'delete_button'
    end
  end
end

def action_items(resource_class)
  config.clear_action_items!
  create_object
  edit_object
  delete_object(resource_class)
end
