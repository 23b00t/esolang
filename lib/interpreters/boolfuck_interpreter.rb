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

        translate_output_bits_to_chars
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

      def translate_output_bits_to_chars
        # Translate back to ASCII char: e.g. "00010010".reverse.to_i(2).chr
        # fill up @output with 0's that % 8 == 0, split in groups of 8 and do with each block .reverse.to_i(2).chr
        zeros_count_to_fill = (@output.length % 8).zero? ? 0 : 8 - (@output.length % 8)

        @output.fill(0, @output.length, zeros_count_to_fill).each_slice(8).map do |byte|
          byte.join.reverse.to_i(2).chr
        end.join
      end
    end
  end
end
