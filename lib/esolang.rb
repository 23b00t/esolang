# lib/esolang.rb
require_relative 'esolang/interpreters/boolfuck_interpreter'
require_relative 'esolang/interpreters/smallfuck_interpreter'
require_relative 'esolang/refinements/refinements'

module Esolang
  def self.boolfuck(code, input = '')
    Interpreters::Boolfuck.new(code, input).run
  end
end
