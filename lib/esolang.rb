# lib/esolang.rb
require_relative '../lib/interpreters/boolfuck_interpreter.rb'
# require_relative '../lib/interpreters/smallfuck_interpreter.rb'
require_relative '../lib/refinements/refinements.rb'

module Esolang
  def self.boolfuck(code, input = '')
    Interpreters::Boolfuck.new(code, input).run
  end
end
