# esolang

A gem for interpreting esoteric programming languages.

Supported at the moment: Smallfuck, Boolfuck, Paintfuck

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
