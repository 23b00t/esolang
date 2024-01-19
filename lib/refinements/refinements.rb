module Esolang
  module Refinements
    refine String do
      def boolfuck(input = '')
        Esolang.boolfuck(self, input)
      end

      def smallfuck(input = '')
        Esolang.smallfuck(self, input)
      end
    end
  end
end
