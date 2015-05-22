module Laranja
  class Internet < Generator
    class << self
      def email(name = nil)
        strf username(name || Laranja::Nome.nome) + '@%email'
      end

      def username(name = nil, sep = ['', '.', '_'])
        (name || Laranja::Nome.nome).gsub(/[^a-zA-Z0-9\s]/, '').split.join(sep.sample).downcase
      end

      def password(min = 8, max = 128)
        strf '&' * (min + rand(max - min))
      end
    end
  end
end
