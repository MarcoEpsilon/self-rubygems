lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "avertasks/version"

Gem::Specification.new do |spec|
  spec.name          = "avertasks"
  spec.version       = Avertasks::VERSION
  spec.authors       = ["MarcoEpsilon"]
  spec.email         = ["rgbmarco@gmail.com"]

  spec.summary       = %q{Produce reasonable number of threads to completed the tasks}
  spec.description   = %q{To use it, we only need placed tasks in taskqueue and wait it, like download many files from network}
  spec.homepage      = "https://github.com/MarcoEpsilon/self-rubygems/tree/avertasks"
  spec.license       = "MIT"

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/MarcoEpsilon/self-rubygems/tree/avertasks"
  spec.metadata["changelog_uri"] = "https://github.com/MarcoEpsilon/self-rubygems/tree/avertasks"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) } + Dir.glob('./lib/avertasks/*').append(*Dir.glob('./lib/test/*').append(*Dir.glob('./lib/*')))
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
