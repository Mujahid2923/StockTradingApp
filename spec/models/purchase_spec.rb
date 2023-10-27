# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase do
  describe 'associations' do
    it { is_expected.to belong_to(:user).inverse_of(:purchases) }
    it { is_expected.to belong_to(:business).inverse_of(:purchases) }
  end
end
