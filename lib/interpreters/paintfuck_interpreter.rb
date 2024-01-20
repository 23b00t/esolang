module Esolang
  module Interpreters
    class Paintfuck
      def initialize(code, iterations, width, height)
        @code = code.gsub(/[^nesw\*\[\]]/, '').chars
        @iterations = iterations
        @width = width
        @height = height
        @data_grid = generate_zero_grid
        @code_pointer = 0
        @grid_pointer = [0, 0]
        @loop_map = create_loop_map
      end

      def run
        while running? do
          command = @code[@code_pointer]
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
        # XOR bit flip
        current_bit(current_bit ^ 1)
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

      def running?
        @iterations.positive? &&
        @code_pointer < @code.length
      end

      def generate_zero_grid
        (1..@height).map { [0] * @width }
      end
    end
  end
end
