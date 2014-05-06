module Laranja
  class Document < Base

    def self.cpf(uf = nil)
      cpf = uf.nil? ? strf('#########') : strf('########') + uf_code(uf)
      cpf + verification_digits(cpf).join
    end

    def self.formatted_cpf(uf = nil)
      c = cpf(uf)
      '%03d.%03d.%03d-%02d' % [ c[0..2].to_i, c[3..5].to_i, c[6..8].to_i, c[9..10].to_i ]
    end

    def self.rg
      strf '#########'
    end

    def self.formatted_rg
      strf '##.###.###-#'
    end

    private

    def self.uf_code(uf)
      data('codigo_uf')[uf.to_s.downcase].to_s
    end

    def self.verification_digits(cpf)
      v = [(0..8).inject(0) { |sum, i| sum + cpf[i].to_i * (10 - i) } % 11]
      v[0] = v[0] < 2 ? 0 : 11 - v[0]
      v[1] = ((0..8).inject(0) { |sum, i| sum + cpf[i].to_i * (11 - i) } + v[0] * 2) % 11
      v[1] = v[1] < 2 ? 0 : 11 - v[1]
      v
    end

  end
end