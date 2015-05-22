module Laranja
  class Documento < Generator
    class << self
      def cpf(uf = nil)
        cpf = uf.nil? ? strf('#########') : strf('########') + uf_code(uf)
        cpf + verification_digits(cpf).join
      end

      def cpf_formatado(uf = nil)
        c = cpf(uf)
        '%03d.%03d.%03d-%02d' % [ c[0..2].to_i, c[3..5].to_i, c[6..8].to_i, c[9..10].to_i ]
      end

      def rg
        strf '#########'
      end

      def rg_formatado
        strf '##.###.###-#'
      end

      private

      def uf_code(uf)
        data('codigo_uf')[uf.to_s.downcase].to_s
      end

      def verification_digits(cpf)
        v = [(0..8).inject(0) { |sum, i| sum + cpf[i].to_i * (10 - i) } % 11]
        v[0] = v[0] < 2 ? 0 : 11 - v[0]
        v[1] = ((0..8).inject(0) { |sum, i| sum + cpf[i].to_i * (11 - i) } + v[0] * 2) % 11
        v[1] = v[1] < 2 ? 0 : 11 - v[1]
        v
      end
    end
  end
end
