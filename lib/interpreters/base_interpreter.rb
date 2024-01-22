# frozen_string_literal: true

module Esolang
  module Interpreters
    # The BaseInterpreter class provides a common interface and basic functionality for
    # interpreting esoteric programming languages.
    class BaseInterpreter
      # Initializes a new instance of the BaseInterpreter class.
      #
      # @param code [String] The code to interpret.
      def initialize(code)
        @code = code.chars
        @code_pointer = 0
        @loop_map = create_loop_map
        @tape_pointer = 0
      end

      # Executes the interpretation of the code. Subclasses must implement this method.
      #
      # @abstract Subclasses must implement the run method.
      # @raise [NotImplementedError] Raised if the method is not implemented by subclasses.
      def run
        raise NotImplementedError, 'Subclasses must implement the run method'
      end

      private

      # Moves the tape pointer to the right.
      def move_right
        @tape_pointer += 1
      end

      # Moves the tape pointer to the left.
      def move_left
        @tape_pointer -= 1
      end

      # Reads input and writes it to the tape.
      def input_to_tape
        @input.empty? ? current_bit(0) : current_bit(@input.shift)
      end

      # Reads the tape and appends the current bit to the output array.
      def tape_to_output_array
        @output << current_bit
      end

      # Creates a map of loop indices for efficient loop navigation.
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

      # Jumps to the matching ']' if the current bit is zero.
      def loop_begin
        return unless current_bit.zero?

        @code_pointer = @loop_map[@code_pointer]
      end

      # Jumps back to the matching '[' if the current bit is non-zero.
      def loop_end
        return if current_bit.zero?

        @code_pointer = @loop_map.key(@code_pointer)
      end

      # Flips the current bit.
      def flip
        current_bit(current_bit ^ 1)
      end

      # Retrieves the value of the current bit. Subclasses must implement this method.
      #
      # @abstract Subclasses must implement the current_bit method.
      # @raise [NotImplementedError] Raised if the method is not implemented by subclasses.
      def current_bit
        raise NotImplementedError, 'Subclasses must implement the current_bit method'
      end

      # Checks if the interpreter is still running (code execution is not completed).
      def running?
        @code_pointer < @code.length
      end

      # Retrieves the current command in the code.
      def command
        @code[@code_pointer]
      end
    end
  end
end
