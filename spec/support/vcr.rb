VCR.configure do |vcr|
  vcr.cassette_library_dir = 'spec/vcr'
  vcr.hook_into :webmock
  vcr.default_cassette_options = { record: :once, match_requests_on: [:method, :host, :path] }
end
