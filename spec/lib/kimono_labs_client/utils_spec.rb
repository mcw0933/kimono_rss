require 'rails_helper'
require 'json'

RSpec.describe KimonoLabsClient::Utils do
  context 'given a diff to perform' do
    let(:a) { JSON.parse('{ "field1": "value", "field2": 5 }') }
    let(:b) { JSON.parse('{ "field2": 5, "field1": "value" }') }
    subject { described_class }

    it 'detects diffs' do
      expect(subject.diff(nil, a)).equal? true
    end

    it 'does not detect false positives when diffing' do
      expect(subject.diff(b, a)).equal? false
    end
  end
end
