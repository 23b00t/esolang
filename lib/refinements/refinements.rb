# frozen_string_literal: true

module Esolang
  # The Refinements module provides refinements for String class to enable
  # direct interpretation of esoteric programming languages.
  #
  # To use these refinements, you need to include them using the `using` keyword:
  #
  # ```ruby
  # require 'esolang'
  # ```
  module Refinements
    # Refines the String class to provide a convenient method for interpreting Boolfuck code.
    refine String do
      # Interprets Boolfuck code directly on a String.
      #
      # @param input [String] The input for the Boolfuck program (optional).
      # @return [String] The result of the Boolfuck interpretation.
      def boolfuck(input = '')
        Esolang::Interpreters::Boolfuck.new(self, input).run
      end

      # Interprets Smallfuck code directly on a String.
      #
      # @param tape [String] The initial tape state for the Smallfuck program.
      # @return [String] The result of the Smallfuck interpretation.
      def smallfuck(tape)
        Esolang::Interpreters::Smallfuck.new(self, tape).run
      end

      # Interprets Paintfuck code directly on a String.
      #
      # @param iterations [Integer] The number of iterations for the Paintfuck program.
      # @param width [Integer] The width of the Paintfuck canvas.
      # @param height [Integer] The height of the Paintfuck canvas.
      # @return [String] The result of the Paintfuck interpretation.
      def paintfuck(iterations, width, height)
        Esolang::Interpreters::Paintfuck.new(self, iterations, width, height).run
      end

      # Interprets Brainfuck code directly on a String.
      #
      # @param input [String] The input for the Brainfuck program (optional).
      # @return [String] The result of the Brainfuck interpretation.
      def brainfuck(input = '')
        Esolang::Interpreters::Brainfuck.new(self, input).run
      end

      # Interprets Ook! code directly on a String.
      #
      # @param input [String] The input for the Ook! program (optional).
      # @return [String] The result of the Ook! interpretation.
      def ook(input = '')
        Esolang::Interpreters::Ook.new(self, input).run
      end
    end
  end
end
