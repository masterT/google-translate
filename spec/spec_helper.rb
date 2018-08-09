require 'bundler/setup'
require 'google_translate'
require_relative './support/helpers/fixture_helper'
require_relative './support/helpers/cli_helper'

fixtures_dirname = 'fixtures'
fixtures_path = File.join(File.dirname(__FILE__), fixtures_dirname)

RSpec.configure do |config|
  config.add_setting :fixtures_path, default: File.expand_path(fixtures_path)
  config.include FixtureHelper
  config.include CliHelper, type: :cli
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
