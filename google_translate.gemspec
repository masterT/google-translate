lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "google_translate/version"

Gem::Specification.new do |spec|
  spec.name          = "google_translate"
  spec.version       = GoogleTranslate::VERSION
  spec.authors       = ["Simon Thiboutôt"]
  spec.email         = ["simonthiboutot@hotmail.com"]

  spec.summary       = %q{Translate small text snippet}
  spec.description   = %q{Translate small text snippet with the free and unlimited Google Translate API}
  spec.homepage      = "https://github.com/masterT/google_translate"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency "slop", "~> 4.3"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rspec", "~> 3.0"
end
