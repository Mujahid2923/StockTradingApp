# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role do
  describe 'associations' do
    it { is_expected.to have_many(:users) }
  end

  describe 'validations' do
    before { create(:role) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end

  describe 'enums' do
    let_it_be(:role) { create(:role) }

    it do
      expect(role).to define_enum_for(:name).with_values(
        owner: 0,
        buyer: 1
      ).backed_by_column_of_type(:integer)
    end
  end
end
