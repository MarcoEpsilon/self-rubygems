lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "imgdowner/version"

Gem::Specification.new do |spec|
  spec.name          = "imgdowner"
  spec.version       = Imgdowner::VERSION
  spec.authors       = ["MarcoEpsilon"]
  spec.email         = ["rgbmarco@gmail.com"]

  spec.summary       = %q{download image form network}
  spec.description   = %q{self customize, download image from netword}
  spec.homepage      = "https://github.com/MarcoEpsilon/self-rubygems/tree/imgdowner/imgdowner"
  spec.license       = "MIT"

  #spec.metadata["allowed_push_host"] = "'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/MarcoEpsilon/self-rubygems/tree/imgdowner/imgdowner"
  spec.metadata["changelog_uri"] = "https://github.com/MarcoEpsilon/self-rubygems/tree/imgdowner/imgdowner"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) } + ["lib/imgdowner.rb", 'lib/imgdowner/version.rb', "lib/imgdowner/downloader.rb", "lib/test/tc_download.rb", "lib/test/ts_download.rb"]
  end
  # spec.files = ["lib/imgdowner.rb", 'lib/imgdowner/version.rb', "lib/imgdowner/downloader.rb", "lib/test/tc_download.rb", "lib/test/ts_download.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
