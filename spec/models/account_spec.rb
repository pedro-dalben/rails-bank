# frozen_string_literal: true

# spec/models/account_spec.rb
require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end
end
