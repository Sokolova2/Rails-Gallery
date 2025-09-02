# frozen_string_literal: true

ActiveAdmin.register Image do
  permit_params :category_id, :image

  controller do
    def find_resource
      Image.find(params[:id])
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :category_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:category_id, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
