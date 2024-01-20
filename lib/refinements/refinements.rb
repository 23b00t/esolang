module Esolang
  module Refinements
    refine String do
      def boolfuck(input = '')
        Esolang::Interpreters::Boolfuck.new(self, input).run
      end

      def smallfuck(tape)
        Esolang::Interpreters::Smallfuck.new(self, tape).run
      end

      def paintfuck(iterations, width, height)
        Esolang::Interpreters::Paintfuck.new(self, iterations, width, height).run
      end

      def leo_bytes_to_s
        # Translate back to ASCII char: e.g. "00010010".reverse.to_i(2).chr
        # fill up @output with 0's that % 8 == 0, split in groups of 8 and do with each block .reverse.to_i(2).chr
        bit_array = chars
        zeros_count_to_fill = (bit_array.length % 8).zero? ? 0 : 8 - (bit_array.length % 8)

        bit_array.fill(0, bit_array.length, zeros_count_to_fill).each_slice(8).map do |byte|
          byte.join.reverse.to_i(2).chr
        end.join
      end
    end
  end
end
