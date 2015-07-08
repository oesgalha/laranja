module Laranja
  class Documento < Generator
    class << self
      def cpf(uf = nil)
        number = strf('########') + uf_code(uf)
        number + verification_digits(number).join
      end

      def cpf_formatado(uf = nil)
        c = cpf(uf)
        '%03d.%03d.%03d-%02d' % [ c[0..2].to_i, c[3..5].to_i, c[6..8].to_i, c[9..10].to_i ]
      end

      def rg
        strf('#########')
      end

      def rg_formatado
        strf('##.###.###-#')
      end

      private

      def uf_code(uf)
        if uf
          data('codigo_uf')[uf.to_s.downcase].to_s
        else
          strf('#')
        end
      end

      def verification_digits(cpf)
        v1 = v1_digit(cpf)
        v2 = v2_digit(cpf, v1)
        [v1, v2]
      end

      def v1_digit(cpf)
        v1 = (0..8).reduce(0) { |sum, i| sum + cpf[i].to_i * (10 - i) }
        v1 %= 11
        if v1 < 2
          0
        else
          11 - v1
        end
      end

      def v2_digit(cpf, v1)
        v2 = (0..8).reduce(0) { |sum, i| sum + cpf[i].to_i * (11 - i) }
        v2 += v1 * 2
        v2 %= 11
        if v2 < 2
          0
        else
          11 - v2
        end
      end
    end
  end
end
