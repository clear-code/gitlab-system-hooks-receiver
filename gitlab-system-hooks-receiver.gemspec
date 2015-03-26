# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gitlab-system-hooks-receiver/version"

Gem::Specification.new do |spec|
  spec.name          = "gitlab-system-hooks-receiver"
  spec.version       = GitLabSystemHooksReceiver::VERSION
  spec.authors       = ["Kenji Okimoto"]
  spec.email         = ["okimoto@clear-code.com"]
  spec.summary       = %q{Process GitLab System hooks.}
  spec.description   = %q{Process GitLab System hooks.}
  spec.homepage      = "https://github.com/clear-code/gitlab-system-hooks-receiver"
  spec.license       = "GPL-3.0+"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "github-web-hooks-receiver"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "test-unit-rr"
  spec.add_development_dependency "test-unit-capybara"
end
