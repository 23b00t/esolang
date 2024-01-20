require_relative 'base_interpreter'

module Esolang
  module Interpreters
    class Boolfuck < BaseInterpreter
      def initialize(code, input = '')
        super(code.gsub(/[^,\.;<>\+\[\]]/, ''))
        @input = chars_to_bits(input)
        @output = []
        @tape = Hash.new(0)
      end

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

        @output.join
      end

      private

      def input_to_tape
        @input.empty? ? current_bit(0) : current_bit(@input.shift)
      end

      def tape_to_output_array
        @output << current_bit
      end

      def chars_to_bits(chars)
        # More efficent and better readable method?
        # Translate input to little-endian order bytes: e.g. ["H".ord].pack("C*").unpack("b*")[0]
        chars.chars.map { |char| [char.ord].pack("C*").unpack("b*")[0] }.join.chars.map(&:to_i)
      end

      def current_bit(new_value = nil)
        @tape[@tape_pointer] = new_value unless new_value.nil?

        @tape[@tape_pointer]
      end
    end
  end
end
