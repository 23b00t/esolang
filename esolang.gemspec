Gem::Specification.new do |spec|
  spec.name          = "esolang"
  spec.version       = "0.1.4"
  spec.summary       = %q{A Ruby gem for interpreting esoteric programming languages.}
  spec.description   = <<-DESC
    A gem for working with esoteric programming languages.

    See documentation: https://www.rubydoc.info/gems/esolang/0.1.4
    And github: https://github.com/23b00t/esolang
  DESC
  spec.homepage      = "https://github.com/23b00t/esolang"
  spec.authors       = ["Daniel Kipp"]
  spec.email         = ["daniel.kipp@gmail.com"]
  spec.license       = "MIT"
  spec.files = Dir["lib/**/*", "lib/esolang.rb", "doc/**/*", "README.md"]
  spec.require_paths = ["lib"]
end
