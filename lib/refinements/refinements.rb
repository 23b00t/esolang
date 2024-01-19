module Esolang
  module Refinements
    refine String do
      def boolfuck(input = '')
        Esolang::Interpreters::Boolfuck.new(self, input).run
      end
    end
  end
end
