# frozen_string_literal: true

require_relative 'base_interpreter'

module Esolang
  module Interpreters
    # The Brainfuck class represents an interpreter for the Brainfuck esoteric programming language.
    class Brainfuck < BaseInterpreter
      # Initializes a new instance of the Brainfuck interpreter.
      #
      # @param code [String] The Brainfuck code to interpret.
      # @param input [String] The input for the Brainfuck program (optional).
      def initialize(code, input = '')
        # Added ? to valid chars for compatibility with Ook! But don't parse ? in Brainfuck
        super(code.gsub(/[^\?,\.<>\+-\[\]]/, ''))
        @input = chars_to_bytes(input)
        @output = []
        @tape = Hash.new(0)
      end

      # Executes the interpretation of the Brainfuck code.
      #
      # @return [String] The result of the Brainfuck interpretation.
      def run
        while running? do
          case command
          when ',' then input_to_tape
          when '.' then tape_to_output_array
          when '>' then move_right
          when '<' then move_left
          when '+' then increment
          when '-' then decrement
          when '[' then loop_begin
          when ']' then loop_end
          end

          @code_pointer += 1
        end

        translate_output_bytes_to_chars
      end

      private

      # Increments the value of the current bit on the tape.
      def increment
        current_bit((current_bit + 1) % 256)
      end

      # Decrements the value of the current bit on the tape.
      def decrement
        current_bit((current_bit - 1) % 256)
      end

      # Converts characters to byte values.
      #
      # @param chars [String] The characters to convert.
      # @return [Array<Integer>] The array of byte values.
      def chars_to_bytes(chars)
        chars.chars.map { |char| char.ord }
      end

      # Retrieves or updates the value of the current bit on the tape.
      #
      # @param new_value [Integer] The new value for the current bit (optional).
      # @return [Integer] The value of the current bit.
      def current_bit(new_value = nil)
        @tape[@tape_pointer] = new_value unless new_value.nil?

        @tape[@tape_pointer]
      end

      # Translates the byte values in the output array to characters.
      #
      # @return [String] The translated characters.
      def translate_output_bytes_to_chars
        @output.map { |char| char.chr }.join
      end
    end
  end
end
