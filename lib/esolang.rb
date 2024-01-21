# lib/esolang.rb
require_relative '../lib/interpreters/boolfuck_interpreter.rb'
require_relative '../lib/interpreters/smallfuck_interpreter.rb'
require_relative '../lib/interpreters/paintfuck_interpreter.rb'
require_relative '../lib/interpreters/brainfuck_interpreter.rb'
require_relative '../lib/interpreters/ook_interpreter.rb'

require_relative '../lib/refinements/refinements.rb'

module Esolang
  def self.boolfuck(code, input = '')
    Interpreters::Boolfuck.new(code, input).run
  end

  def self.smallfuck(code, tape)
    Interpreters::Smallfuck.new(code, tape).run
  end

  def self.paintfuck(code, iterations, width, height)
    Interpreters::Paintfuck.new(code, iterations, width, height).run
  end

  def self.brainfuck(code, input = '')
    Interpreters::Brainfuck.new(code, input).run
  end

  def self.ook(code, input = '')
    Interpreters::Ook.new(code, input).run
  end
end
