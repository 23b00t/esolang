Gem::Specification.new do |spec|
  spec.name          = "esolang"
  spec.version       = "0.1.2"
  spec.summary       = %q{A Ruby gem for interpreting esoteric programming languages.}
  spec.description   = <<-DESC
    A gem for working with esoteric programming languages.

    Usage:
      ```ruby
      require 'esolang'
      using Esolang::Refinements

      # Adds string refinements
      code = 'code_string'
      result = code.boolfuck('user_input')

      # Alternative usage
      result = Esolang.boolfuck(code, input)
      ```
    See documentation: [RubyDoc.info](https://www.rubydoc.info/gems/esolang/0.1.2)
  DESC
  spec.homepage      = "https://github.com/23b00t/esolang"
  spec.authors       = ["Daniel Kipp"]
  spec.email         = ["daniel.kipp@gmail.com"]
  spec.license       = "MIT"
  spec.files         = Dir["lib/**/*", "lib/esolang.rb"]
  spec.require_paths = ["lib"]
end
