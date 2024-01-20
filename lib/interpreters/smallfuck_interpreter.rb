module Esolang
  module Interpreters
    class Smallfuck
      def initialize(code, tape)
        @code = code.gsub(/[^<>\*\[\]]/, '').chars
        @tape = tape.chars.map(&:to_i)
        @loop_map = create_loop_map
        @code_pointer = 0
        @tape_pointer = 0
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

      def move_right
        @tape_pointer += 1
      end

      def move_left
        @tape_pointer -= 1
      end

      def create_loop_map
        # Further enhancement of time complexity for big code input by creating the map on the fly?
        map = {}
        stack = []
        @code.each_with_index do |command, index|
          case command
          when '[' then stack << index
          when ']'
            if stack.empty?
              raise StandardError, "Invalid code: No matching '[' for ']' at index #{index}"
            else
              map[stack.pop] = index
            end
          end
        end
        raise StandardError, "Invalid code: No matching ']' for '[' at index #{stack.last}" unless stack.empty?
        map
      end

      def loop_begin
        return unless current_bit.zero?

        @code_pointer = @loop_map[@code_pointer]
      end

      def loop_end
        return if current_bit.zero?

        @code_pointer = @loop_map.key(@code_pointer)
      end

      def flip
        current_bit(current_bit ^ 1)
      end

      def running?
        @code_pointer < @code.length &&
        @tape_pointer < @tape.length &&
        @tape_pointer >= 0
      end

      def command
        @code[@code_pointer]
      end

      def current_bit(new_value = nil)
        @tape[@tape_pointer] = new_value unless new_value.nil?

        @tape[@tape_pointer]
      end
    end
  end
end
