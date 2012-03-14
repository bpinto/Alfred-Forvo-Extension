require 'bundler'
Bundler.require :default, :test

Dir[File.join(File.dirname(__FILE__), '..', 'lib', '**', '*.rb')].each do |f|
  require f
end

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'

  # so we can use `:vcr` rather than `:vcr => true`;
  # in RSpec 3 this will no longer be necessary.
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata! #to enable :vcr
  config.allow_http_connections_when_no_cassette = true

  config.preserve_exact_body_bytes do |http_message|
    http_message.body.encoding.name == 'ASCII-8BIT' ||
    !http_message.body.valid_encoding?
  end
end
