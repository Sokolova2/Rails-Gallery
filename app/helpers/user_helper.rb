# frozen_string_literal: true

module UserHelper
  # TODO: use this method instead of directly calling for image_tag user.avatar.url (in views)
  def avatar_for(user, options = { size: 50 })
    size = options[:size]
    if user.avatar?
      image_tag user.avatar.url, size: size, class: 'rounded-circle'
    else
      image_tag 'avatar.png', size: size, class: 'rounded-circle'
    end
  end
end
