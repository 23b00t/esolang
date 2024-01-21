# lib/interpreters/base_interpreter.rb
module Esolang
  module Interpreters
    class BaseInterpreter
      def initialize(code)
        @code = code.chars
        @code_pointer = 0
        @loop_map = create_loop_map
        @tape_pointer = 0
      end

      def run
        raise NotImplementedError, 'Subclasses must implement the run method'
      end

      private

      def move_right
        @tape_pointer += 1
      end

      def move_left
        @tape_pointer -= 1
      end

      def create_loop_map
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

      def current_bit
        raise NotImplementedError, 'Subclasses must implement the current_bit method'
      end

      def running?
        @code_pointer < @code.length
      end

      def command
        @code[@code_pointer]
      end
    end
  end
end
