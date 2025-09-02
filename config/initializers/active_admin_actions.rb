Rails.application.config.to_prepare do
  ActiveAdmin.application.namespaces.each do |name, namespace|
    namespace.resources.each do |resource_name, resource|
      resource.dsl.instance_eval do
        action_item :custom_destroy, only: :show do
          link_to "Удалить",
                  resource_path(resource),
                  method: :delete,
                  form: { data: { turbo: false } },
                  data: { confirm: "Точно удалить?" }
        end
      end
    end
  end
end