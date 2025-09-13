#frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  # describe 'validations' do
  #   it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:category_id) }
  # end

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:user) }
  end
end


