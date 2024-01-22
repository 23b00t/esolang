# frozen_string_literal: true

require_relative 'base_interpreter'

module Esolang
  module Interpreters
    # The Boolfuck class represents an interpreter for the Boolfuck esoteric programming language.
    class Boolfuck < BaseInterpreter
      # Initializes a new instance of the Boolfuck interpreter.
      #
      # @param code [String] The Boolfuck code to interpret.
      # @param input [String] The input for the Boolfuck program (optional).
      def initialize(code, input = '')
        super(code.gsub(/[^,\.;<>\+\[\]]/, ''))
        @input = chars_to_bits(input)
        @output = []
        @tape = Hash.new(0)
      end

      # Executes the interpretation of the Boolfuck code.
      #
      # @return [String] The result of the Boolfuck interpretation.
      def run
        while running? do
          case command
          when ',' then input_to_tape
          when ';' then tape_to_output_array
          when '>' then move_right
          when '<' then move_left
          when '+' then flip
          when '[' then loop_begin
          when ']' then loop_end
          end

          @code_pointer += 1
        end

        translate_output_bits_to_chars
      end

      private

      # Converts characters to bits (0 or 1).
      #
      # @param chars [String] The characters to convert.
      # @return [Array<Integer>] The array of bits.
      def chars_to_bits(chars)
        chars.chars.map { |char| [char.ord].pack("C*").unpack("b*")[0] }.join.chars.map(&:to_i)
      end

      # Retrieves or updates the value of the current bit on the tape.
      #
      # @param new_value [Integer] The new value for the current bit (optional).
      # @return [Integer] The value of the current bit.
      def current_bit(new_value = nil)
        @tape[@tape_pointer] = new_value unless new_value.nil?

        @tape[@tape_pointer]
      end

      # Translates the bits in the output array to characters.
      #
      # @return [String] The translated characters.
      def translate_output_bits_to_chars
        zeros_count_to_fill = (@output.length % 8).zero? ? 0 : 8 - (@output.length % 8)

        @output.fill(0, @output.length, zeros_count_to_fill).each_slice(8).map do |byte|
          byte.join.reverse.to_i(2).chr
        end.join
      end
    end
  end
end
