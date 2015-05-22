module Laranja
  class Sexo < Generator
    class << self
      def sexo
        strf '%name'
      end

      def sigla
        strf '%abbr'
      end
    end
  end
end
