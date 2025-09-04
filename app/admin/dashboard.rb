# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Last 5 created categories" do
          ul do
            Category.order(created_at: :desc).limit(5).map do |category|
              li class: "category-item" do
                link_to(category.category_name, admin_category_path(category), class: "category-name")
              end
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Last 5 created comments" do
          ul do
            Comment.order(created_at: :desc).limit(5).map do |comment|
              div class: "comment-block" do
                li class:"comment-item" do
                  link_to(comment.comment, admin_user_comment_path(comment), class: "comment")
                end
                li class:"comment-item" do
                  link_to(comment.user.email, admin_user_comment_path(comment), class: "comment-email")
                end
              end
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Last 10 created images" do
          ul class:"image-grid" do
            Image.order(created_at: :desc).limit(10).map do |image|
              li class: "image-item" do
                link_to(image_tag(image.image.url(:medium)), admin_image_path(image), class: "masonry-item")
              end
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Last 10 user actions" do
          table_for UserAction.order(created_at: :desc).limit(10) do
            column("Пользователь") {|action| action.user&.email}
            column("Действия") {|action| action.action_type}
            column("URL") {|action| action.url}
            column("Дата и время") {|action| action.created_at.strftime("%d-%m-%Y %H:%M")}
          end
        end
      end
    end
  end
end
