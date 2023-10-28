# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { is_expected.to belong_to(:role) }
    it { is_expected.to have_many(:businesses).inverse_of(:user).dependent(:destroy) }
    it { is_expected.to have_many(:purchases).inverse_of(:user).dependent(:destroy) }
    it { is_expected.to have_many(:businesses).inverse_of(:user).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
