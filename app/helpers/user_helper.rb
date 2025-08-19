# frozen_string_literal: true

module UserHelper
  def avatar_for(user, options = { size: 50 })
    size = options[:size]
    if user.avatar?
      image_tag user.avatar.url, size: size, class: "rounded-circle"
    else
      image_tag "avatar.png", size: size, class: "rounded-circle"
    end
  end
end