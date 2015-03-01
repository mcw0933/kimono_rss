require 'rails_helper'

RSpec.describe Entry, type: :model do
  context 'when created' do
    subject { described_class.new }

    it 'must have a feed' do
      expect { subject.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end
  end
end
