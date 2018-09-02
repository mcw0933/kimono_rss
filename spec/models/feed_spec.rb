require 'rails_helper'
require 'support/vcr'

RSpec.describe Feed, type: :model do
  context 'when created' do
    subject { described_class.new }

    it 'must have an endpoint' do
      expect { subject.save! }.to raise_error(ActiveRecord::StatementInvalid)
    end
  end

  context 'with any valid feed' do
    let(:endpoint) { Fabricate(:endpoint) }
    subject { described_class.new(endpoint_id: endpoint.id) }

    it 'knows its api id' do
      expect { subject.api_id }.equal? endpoint.kimono_id
    end
  end

  context 'with a new feed' do
    subject { Fabricate(:feed) }

    it 'initially has no entries' do
      expect(subject.latest).to be_nil
    end

    let(:api_key) { ENV.fetch('KIMONO_API_KEY', anything) }
    it 'has a latest entry once it has been polled' do
      VCR.use_cassette('kimonolabs_api_get') do
        KimonoLabsClient::Poller.new(api_key: api_key, feed: subject).poll

        expect(subject.latest).to_not be_nil
      end
    end
  end
end
