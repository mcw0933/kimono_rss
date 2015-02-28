require 'rails_helper'

RSpec.describe Endpoint, type: :model do
  context 'when created' do
    subject { described_class.new }

    it 'requires a kimono_id' do
      expect { subject.save! }.to raise_error
    end
  end

  context 'once established' do
    let(:api_id) { anything }
    subject { described_class.new(kimono_id: api_id) }

    it 'has an id' do
      expect(subject.kimono_id).to_not be_empty
    end
  end
end
