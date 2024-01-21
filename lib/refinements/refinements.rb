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

      def brainfuck(input = '')
        Esolang::Interpreters::Brainfuck.new(self, input).run
      end
    end
  end
end
