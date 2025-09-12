# frozen_string_literal: true

module ApplicationHelper
  def add_user_action(resource, action_type)
    UserAction.create(user: resource, action_type: action_type, url: request.original_url)
  end
end
