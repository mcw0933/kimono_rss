require 'rails_helper'
require 'support/vcr'
require 'json'

RSpec.describe KimonoLabsClient::Poller do
  context 'initializing the poller' do
    it 'raises an error without an api key' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end

    let(:api_key) { ENV.fetch('KIMONO_API_KEY', anything) }
    it 'raises an error without a feed' do
      expect { described_class.new(api_key: api_key) }.to raise_error(ArgumentError)
    end
  end

  context 'with a valid poller' do
    let(:api_key) { ENV.fetch('KIMONO_API_KEY', anything) }
    let(:feed) { Fabricate(:feed) }
    subject { described_class.new(api_key: api_key, feed: feed) }

    it 'updates an empty feed' do
      VCR.use_cassette('kimonolabs_api_get') do
        expect { subject.poll }.to_not raise_error

        expect(feed.latest).to_not be_empty
      end
    end

    let(:prev) { feed.latest }
    it 'does not update a current feed' do
      VCR.use_cassette('kimonolabs_api_get') do
        expect(subject.poll).equal? prev
      end
    end
  end
end
