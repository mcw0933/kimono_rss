require 'rails_helper'

RSpec.describe KimonoLabsClient::WebClient do
  context 'initializing the web client' do
    it 'raises an error without an api key' do
      expect { described_class.new }.to raise_error
    end
  end

  context 'performing an api list' do
    subject { described_class.new(api_key: api_key) }

    it 'does not perform an action on its own' do
      expect { subject.call }.to raise_error
    end
  end
end
