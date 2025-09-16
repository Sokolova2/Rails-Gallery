# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'add user action' do
    subject { create(:user_action) }

    it 'return successfully created action' do
      expect { subject }.to change(UserAction, :count).by(1)
    end
  end
end


