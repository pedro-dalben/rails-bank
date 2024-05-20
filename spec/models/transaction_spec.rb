# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should belong_to(:sender).class_name('Account').with_foreign_key('sender_id') }
  it { should belong_to(:receiver).class_name('Account').with_foreign_key('receiver_id') }
  it { should belong_to(:payment_method) }

  it { should validate_presence_of(:sender_id) }
  it { should validate_presence_of(:receiver_id) }
  it { should validate_presence_of(:payment_method_id) }
end
