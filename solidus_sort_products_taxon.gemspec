# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solidus_sort_products_taxon/version'

Gem::Specification.new do |spec|
  spec.name          = "solidus_sort_products_taxon"
  spec.version       = SolidusSortProductsTaxon::VERSION
  spec.authors       = ["Noel"]
  spec.email         = ["noel@2bedigital.com"]

  spec.summary       = %q{This gem permited sort new products to first position in taxon.}
  spec.description   = %q{This gem permited sort new products to first position in taxon.}

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.requirements << 'none'

  spec.add_dependency 'solidus_core', '>= 2.1'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
