VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.hook_into :fakeweb
  config.ignore_localhost = true
  config.allow_http_connections_when_no_cassette = true
  config.default_cassette_options = { :serialize_with => :json }
end