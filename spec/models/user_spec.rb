# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_one(:account).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should_not allow_value('userexample.com').for(:email) }
    it { should validate_length_of(:email).is_at_most(70) }
  end

  describe 'callbacks' do
    it 'creates an account after user creation' do
      user = create(:user)
      expect(user.account).to be_present
    end
  end
end
