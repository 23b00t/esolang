require_relative 'base_interpreter'

module Esolang
  module Interpreters
    class Paintfuck < BaseInterpreter
      def initialize(code, iterations, width, height)
        super(code.gsub(/[^nesw\*\[\]]/, ''))
        @iterations = iterations
        @width = width
        @height = height
        @data_grid = generate_zero_grid
        @grid_pointer = [0, 0]
      end

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

      def move_up
        @grid_pointer[0] = (@grid_pointer.first - 1 + @height) % @height
      end

      def move_down
        @grid_pointer[0] = (@grid_pointer.first + 1 + @height) % @height
      end

      def move_right
        @grid_pointer[1] = (@grid_pointer.last + 1 + @width) % @width
      end

      def move_left
        @grid_pointer[1] = (@grid_pointer.last - 1 + @width) % @width
      end

      def current_bit(new_value = nil)
        @data_grid[@grid_pointer.first][@grid_pointer.last] = new_value unless new_value.nil?

        @data_grid[@grid_pointer.first][@grid_pointer.last]
      end

      def output
        @data_grid
          .map { |row| row.join }
          .join("\r\n")
      end

      def generate_zero_grid
        (1..@height).map { [0] * @width }
      end

      def running?
        @iterations.positive? && super
      end
    end
  end
end
