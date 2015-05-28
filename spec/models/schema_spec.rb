require 'rails_helper'

RSpec.describe Schema, type: :model do
  context 'when created' do
    subject { described_class.new }

    it 'must have an endpoint' do
      subject.structure = '{ "field": "value" }'
      expect { subject.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end

    it 'must have a non-nil structure' do
      subject.structure = nil
      expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'must have a non-empty structure' do
      subject.structure = '{ }'
      expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is effective for the indefinite future' do
      expect(subject.effective).to cover(Time.zone.now)
      expect(subject.effective).to cover(10_000.years.from_now)
    end
  end
end
