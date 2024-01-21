require_relative 'base_interpreter'

module Esolang
  module Interpreters
    class Brainfuck < BaseInterpreter
      def initialize(code, input = '')
        super(code.gsub(/[^,\.<>\+-\[\]]/, ''))
        @input = chars_to_bytes(input)
        @output = []
        @tape = Hash.new(0)
      end

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

      def increment
        current_bit((current_bit + 1) % 256)
      end

      def decrement
        current_bit((current_bit - 1) % 256)
      end

      def chars_to_bytes(chars)
        chars.chars.map { |char| char.ord }
      end

      def current_bit(new_value = nil)
        @tape[@tape_pointer] = new_value unless new_value.nil?

        @tape[@tape_pointer]
      end

      def translate_output_bytes_to_chars
        @output.map { |char| char.chr }.join
      end
    end
  end
end
