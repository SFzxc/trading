
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trading/version"

Gem::Specification.new do |spec|
  spec.name          = "coin_trading"
  spec.version       = Trading::VERSION
  spec.authors       = ["SFzxc"]
  spec.email         = ["hoangphuocvanlong@gmail.com"]

  spec.summary       = %q{Support trading via cli}
  spec.description   = %q{Check coins price on binance exchange}
  spec.homepage      = "https://github.com/SFzxc/trading"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry-rails'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'

  spec.add_runtime_dependency 'gli'
  spec.add_runtime_dependency 'binance', '1.2.0'
  spec.add_runtime_dependency 'rainbow'
  spec.add_runtime_dependency 'terminal-table', '1.5.2'
end
