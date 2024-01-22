# frozen_string_literal: true

require_relative 'brainfuck_interpreter'

module Esolang
  module Interpreters
    # The Ook class represents an interpreter for the Ook! esoteric programming language,
    # which is translated to Brainfuck for execution.
    class Ook < Brainfuck
      # Initializes a new instance of the Ook interpreter.
      #
      # @param code [String] The Ook code to interpret.
      # @param input [String] The input for the Ook program (optional).
      def initialize(code, input = '')
        super(translate_to_brainfuck(code), input)
        @input = input
      end

      # Executes the interpretation of the Ook code.
      #
      # @return [String] The result of the Ook interpretation.
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
          when '?' then banana
          end

          @code_pointer += 1
        end

        translate_output_bytes_to_chars
      end

      private

      # Translates Ook! code to Brainfuck code.
      #
      # @param code [String] The Ook code to translate.
      # @return [String] The translated Brainfuck code.
      def translate_to_brainfuck(code)
        code.gsub(/[^\.\!\?]/, '').chars.each_slice(2).map do |command|
          case command.join
          when ".?" then ">"
          when "?." then "<"
          when ".." then "+"
          when "!!" then "-"
          when "!." then "."
          when ".!" then ","
          when "!?" then "["
          when "?!" then "]"
          when "??" then "?"
          end
        end.join
      end

      # Prints a message indicating that the memory pointer got a banana.
      def banana
        puts "The memory pointer got a banana"
      end
    end
  end
end
