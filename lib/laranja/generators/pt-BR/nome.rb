module Laranja
  class Nome < Generator
    class << self
      def nome(sobrenomes = 1)
        strf [
          '%female_first_name ' + ('%last_name ' * sobrenomes).strip,
          '%male_first_name ' + ('%last_name ' * sobrenomes).strip,
          '%female_first_name ' + ('%last_name ' * sobrenomes) + '%female_suffix',
          '%male_first_name ' + ('%last_name ' * sobrenomes) + '%male_suffix',
        ].sample
      end

      def primeiro_nome
        strf [
          '%female_first_name',
          '%male_first_name'
        ].sample
      end

      def sobrenome
        strf '%last_name'
      end
    end
  end
end
