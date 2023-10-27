# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { is_expected.to have_many(:businesses).inverse_of(:user).dependent(:destroy) }
    it { is_expected.to have_many(:purchases).inverse_of(:user).dependent(:destroy) }
    it { is_expected.to have_many(:businesses).inverse_of(:user).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:role) }
  end

  describe 'enum' do
    it { is_expected.to define_enum_for(:role).with_values(owner: 0, buyer: 1).backed_by_column_of_type(:integer) }
  end
end
