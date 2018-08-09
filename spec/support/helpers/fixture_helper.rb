require 'json'

module FixtureHelper
  def fixtures_path
    RSpec.configuration.fixtures_path
  end

  def fixture_path(filename)
    File.join(fixtures_path, filename)
  end

  def fixture_file(filename)
    File.new(fixture_path(filename))
  end

  def fixture_raw(filename)
    fixture_file(filename).read
  end

  def fixture_json(filename)
    JSON.parse(fixture_raw(filename))
  end
end
