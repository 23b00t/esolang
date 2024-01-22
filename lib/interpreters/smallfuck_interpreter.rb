# frozen_string_literal: true

require_relative 'base_interpreter'

module Esolang
  module Interpreters
    # The Smallfuck class represents an interpreter for the Smallfuck esoteric programming language.
    class Smallfuck < BaseInterpreter
      # Initializes a new instance of the Smallfuck interpreter.
      #
      # @param code [String] The Smallfuck code to interpret.
      # @param tape [String] The initial tape state for the Smallfuck program.
      def initialize(code, tape)
        super(code.gsub(/[^<>\*\[\]]/, ''))
        @tape = tape.chars.map(&:to_i)
      end

      # Executes the interpretation of the Smallfuck code.
      #
      # @return [String] The result of the Smallfuck interpretation.
      def run
        while running? do
          case command
          when '>' then move_right
          when '<' then move_left
          when '*' then flip
          when '[' then loop_begin
          when ']' then loop_end
          end
          @code_pointer += 1
        end
        @tape.join
      end

      private

      # Checks if the interpreter is still running (code execution is not completed).
      #
      # @return [Boolean] Returns true if the interpreter is still running, otherwise false.
      def running?
        @tape_pointer < @tape.length &&
        @tape_pointer >= 0 &&
        super
      end

      # Retrieves or updates the value of the current bit on the tape.
      #
      # @param new_value [Integer] The new value for the current bit (optional).
      # @return [Integer] The value of the current bit.
      def current_bit(new_value = nil)
        @tape[@tape_pointer] = new_value unless new_value.nil?

        @tape[@tape_pointer]
      end
    end
  end
end
