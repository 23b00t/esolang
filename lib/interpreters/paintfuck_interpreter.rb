# frozen_string_literal: true

require_relative 'base_interpreter'

module Esolang
  module Interpreters
    # The Paintfuck class represents an interpreter for the Paintfuck esoteric programming language.
    class Paintfuck < BaseInterpreter
      # Initializes a new instance of the Paintfuck interpreter.
      #
      # @param code [String] The Paintfuck code to interpret.
      # @param iterations [Integer] The number of iterations for the Paintfuck program.
      # @param width [Integer] The width of the Paintfuck canvas.
      # @param height [Integer] The height of the Paintfuck canvas.
      def initialize(code, iterations, width, height)
        super(code.gsub(/[^nesw\*\[\]]/, ''))
        @iterations = iterations
        @width = width
        @height = height
        @data_grid = generate_zero_grid
        @grid_pointer = [0, 0]
      end

      # Executes the interpretation of the Paintfuck code.
      #
      # @return [String] The result of the Paintfuck interpretation.
      def run
        while running? do
          case command
          when 'n' then move_up
          when 'e' then move_right
          when 's' then move_down
          when 'w' then move_left
          when '*' then flip
          when '[' then loop_begin
          when ']' then loop_end
          end

          @code_pointer += 1
          @iterations -= 1
        end

        output
      end

      private

      # Moves the grid pointer up.
      def move_up
        @grid_pointer[0] = (@grid_pointer.first - 1 + @height) % @height
      end

      # Moves the grid pointer down.
      def move_down
        @grid_pointer[0] = (@grid_pointer.first + 1 + @height) % @height
      end

      # Moves the grid pointer right.
      def move_right
        @grid_pointer[1] = (@grid_pointer.last + 1 + @width) % @width
      end

      # Moves the grid pointer left.
      def move_left
        @grid_pointer[1] = (@grid_pointer.last - 1 + @width) % @width
      end

      # Retrieves or updates the value of the current bit on the Paintfuck canvas.
      #
      # @param new_value [Integer] The new value for the current bit (optional).
      # @return [Integer] The value of the current bit.
      def current_bit(new_value = nil)
        @data_grid[@grid_pointer.first][@grid_pointer.last] = new_value unless new_value.nil?

        @data_grid[@grid_pointer.first][@grid_pointer.last]
      end

      # Retrieves the output of the Paintfuck program.
      #
      # @return [String] The Paintfuck canvas as a string.
      def output
        @data_grid
          .map { |row| row.join }
          .join("\r\n")
      end

      # Generates a canvas grid filled with zeros.
      #
      # @return [Array<Array<Integer>>] The zero-filled grid.
      def generate_zero_grid
        (1..@height).map { [0] * @width }
      end

      # Checks if the interpreter is still running (code execution is not completed).
      #
      # @return [Boolean] Returns true if the interpreter is still running, otherwise false.
      def running?
        @iterations.positive? && super
      end
    end
  end
end
