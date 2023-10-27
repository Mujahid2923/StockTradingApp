# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Business do
  describe 'associations' do
    it { is_expected.to belong_to(:user).inverse_of(:businesses) }
    it { is_expected.to have_many(:purchases).inverse_of(:business).dependent(:destroy) }
    it { is_expected.to have_many(:orders).inverse_of(:business).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:shares_available) }
  end
end
