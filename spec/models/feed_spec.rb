require 'rails_helper'

RSpec.describe Feed, type: :model do
  context 'when created' do
    subject { described_class.new }

    it 'must have an endpoint' do
      expect { subject.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end
  end
end
