# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order do
  describe 'associations' do
    it { is_expected.to belong_to(:user).inverse_of(:orders) }
    it { is_expected.to belong_to(:business).inverse_of(:orders) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:price) }

    it { is_expected.to validate_numericality_of(:quantity).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:price).only_integer.is_greater_than(0) }
  end
end
