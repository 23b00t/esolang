# esolang

A gem for working with esoteric programming languages.

## Installation

To use the `esolang` gem, you can install it via:

```bash
gem install esolang-0.1.0.pre.gem
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
puts code.boolfuck.leo_bytes_to_s
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
This gem also provides a method `leo_bytes_to_s` (as part of the Refinements) for translating binary strings back to ASCII characters.
For more details on usage and supported esoteric languages, refer to the gem's documentation.

## TODOs:

- Refactor `boolfuck_interpreter`:
  - Enhance time complexity

- Add `smallfuck_interpreter` (and more esoteric languages)

- Add more tests
