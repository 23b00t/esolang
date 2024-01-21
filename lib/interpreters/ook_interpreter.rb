require_relative 'brainfuck_interpreter'

module Esolang
  module Interpreters
    class Ook < Brainfuck
      def initialize(code, input = '')
        super(translate_to_brainfuck(code), input)
        @input = input
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
          when '?' then banana
          end

          @code_pointer += 1
        end

        translate_output_bytes_to_chars
      end

      private

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

      def banana
        puts "The memory pointer got a banana"
      end
    end
  end
end
