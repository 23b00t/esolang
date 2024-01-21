# esolang

A gem for interpreting esoteric programming languages.

Supported at the moment: Smallfuck, Boolfuck, Paintfuck, Brainfuck, Ook! (with method to feet the memory pointer with bananas)

This gem is inspired by [this](https://www.codewars.com/kata/esolang-interpreters-number-1-introduction-to-esolangs-and-my-first-interpreter-ministringfuck) Kata Series on Codewars that ignited my passion for esolangs. Special thanks to the author [donaldsebleung](https://www.codewars.com/users/donaldsebleung).

Codesnippets for tests and examples are copies or variations from [Esolangs wiki](https://esolangs.org/) or [Wikipedia](https://www.wikipedia.org/)

This is an ongoing fun and educational project, and the author assumes no liability for the accuracy and completeness of the implementations.

## Installation

To use the `esolang` gem, you can install it via:

```bash
gem install esolang-0.1.1.pre.gem
```

## Example Usage
```ruby
require 'esolang'
using Esolang::Refinements

code = ";;;+;+;;+;+;
    +;+;+;+;;+;;+;
    ;;+;;+;+;;+;
    ;;+;;+;+;;+;
    +;;;;+;+;;+;
    ;;+;;+;+;+;;
    ;;;;;+;+;;
    +;;;+;+;;;+;
    +;;;;+;+;;+;
    ;+;+;;+;;;+;
    ;;+;;+;+;;+;
    ;;+;+;;+;;+;
    +;+;;;;+;+;;
    ;+;+;+;

puts code.boolfuck
```
This gem adds string refinements. You can use the `boolfuck` method directly on a string:
```ruby
require 'esolang'
using Esolang::Refinements

code.boolfuck('user_input')
```
Alternatively, you can use the `Esolang` module:
```ruby
require 'esolang'

Esolang.boolfuck(code, input)
```
