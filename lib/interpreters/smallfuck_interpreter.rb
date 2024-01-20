require_relative 'base_interpreter'

module Esolang
  module Interpreters
    class Smallfuck < BaseInterpreter
      def initialize(code, tape)
        super(code.gsub(/[^<>\*\[\]]/, ''))
        @tape = tape.chars.map(&:to_i)
      end

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

      def running?
        @tape_pointer < @tape.length &&
        @tape_pointer >= 0 &&
        super
      end

      def current_bit(new_value = nil)
        @tape[@tape_pointer] = new_value unless new_value.nil?

        @tape[@tape_pointer]
      end
    end
  end
end
