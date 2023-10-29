# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Permission do
  let_it_be(:permission) { create(:permission, accessor: create(:role)) }

  describe 'validating permission' do
    it 'has a valid data' do
      expect(permission).to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:accessor) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:resource) }

    it do
      expect(permission)
        .to validate_uniqueness_of(:resource)
        .scoped_to(:accessor_id, :accessor_type)
        .ignoring_case_sensitivity
    end
  end
end
