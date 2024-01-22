# frozen_string_literal: true

require_relative '../lib/interpreters/boolfuck_interpreter.rb'
require_relative '../lib/interpreters/smallfuck_interpreter.rb'
require_relative '../lib/interpreters/paintfuck_interpreter.rb'
require_relative '../lib/interpreters/brainfuck_interpreter.rb'
require_relative '../lib/interpreters/ook_interpreter.rb'

require_relative '../lib/refinements/refinements.rb'

# The Esolang module provides methods to interpret esoteric programming languages.
#
# To use it you need to:
  #
  # ```ruby
  # using Esolang::Refinements
  # ```
module Esolang
  # Interprets Boolfuck code.
  #
  # @param code [String] The Boolfuck code to interpret.
  # @param input [String] The input for the Boolfuck program (optional).
  # @return [String] The result of the Boolfuck interpretation.
  def self.boolfuck(code, input = '')
    Interpreters::Boolfuck.new(code, input).run
  end

  # Interprets Smallfuck code.
  #
  # @param code [String] The Smallfuck code to interpret.
  # @param tape [String] The initial tape state for the Smallfuck program.
  # @return [String] The result of the Smallfuck interpretation.
  def self.smallfuck(code, tape)
    Interpreters::Smallfuck.new(code, tape).run
  end

  # Interprets Paintfuck code.
  #
  # @param code [String] The Paintfuck code to interpret.
  # @param iterations [Integer] The number of iterations for the Paintfuck program.
  # @param width [Integer] The width of the Paintfuck canvas.
  # @param height [Integer] The height of the Paintfuck canvas.
  # @return [String] The result of the Paintfuck interpretation.
  def self.paintfuck(code, iterations, width, height)
    Interpreters::Paintfuck.new(code, iterations, width, height).run
  end

  # Interprets Brainfuck code.
  #
  # @param code [String] The Brainfuck code to interpret.
  # @param input [String] The input for the Brainfuck program (optional).
  # @return [String] The result of the Brainfuck interpretation.
  def self.brainfuck(code, input = '')
    Interpreters::Brainfuck.new(code, input).run
  end

  # Interprets Ook! code.
  #
  # @param code [String] The Ook! code to interpret.
  # @param input [String] The input for the Ook! program (optional).
  # @return [String] The result of the Ook! interpretation.
  def self.ook(code, input = '')
    Interpreters::Ook.new(code, input).run
  end
end
