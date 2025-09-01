# frozen_string_literal: true

ActiveAdmin.register Comment, as: "UserComment" do

  permit_params :comment, :user_id, :image_id, :category_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :image_id, :category_id, :comment
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :image_id, :category_id, :comment]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
