Gem::Specification.new do |spec|
  spec.name          = "esolang"
  spec.version       = "0.1.1.pre"
  spec.summary       = "Interpreter gem for different Esolangs"
  spec.description   = "A gem for working with esoteric programming languages.
                        Usage: require 'esolang'; using Esolang::Refinements
                        Adds string refinements, usage: e.g. 'code_string'.boolfuck('user_input'). Alternative usage: e.g. Esolang.boolfuck(code, input)"
  spec.authors       = ["Daniel Kipp"]
  spec.email         = ["daniel.kipp@gmail.com"]
  spec.license       = "MIT"
  spec.files         = Dir["lib/**/*", "lib/esolang.rb"]
  spec.require_paths = ["lib"]
end
