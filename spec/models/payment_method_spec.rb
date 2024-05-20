# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:taxa) }
  end

  describe '#fee' do
    let(:payment_method_p) { create(:payment_method, code: 'P', taxa: 2.0) }
    let(:payment_method_d) { create(:payment_method, code: 'D', taxa: 5.0) }

    it 'returns 0 for payment method P' do
      expect(payment_method_p.fee(100)).to eq(0)
    end

    it 'calculates fee for other payment methods' do
      expect(payment_method_d.fee(100)).to eq(5.0)
    end
  end
end
