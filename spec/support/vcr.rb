VCR.configure do |vcr|
  vcr.cassette_library_dir = 'spec/vcr'
  vcr.hook_into :webmock
end
