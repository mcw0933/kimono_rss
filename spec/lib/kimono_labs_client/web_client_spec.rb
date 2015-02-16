require 'rails_helper'
require 'support/vcr'

RSpec.describe KimonoLabsClient::WebClient do
  context 'initializing the web client' do
    it 'raises an error without an api key' do
      expect { described_class.new }.to raise_error
    end
  end

  context 'given an api key' do
    let(:api_key) { ENV.fetch('KIMONO_API_KEY', anything) }
    subject { described_class.new(api_key: api_key) }

    it 'lists available apis for the api key' do
      VCR.use_cassette('kimonolabs_api_list', record: :new_episodes) do
        expect(subject.list).to_not be_empty
      end
    end
  end
end
