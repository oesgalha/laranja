module Laranja
  class CPF < Base

    def self.cpf(uf = nil)
      cpf = '########U'.sub(/U/, uf.nil? ? '#' : uf_code(uf)).gsub(/#/) { rand(10).to_s }
      v = [(0..8).inject(0) { |sum, i| sum + cpf[i].to_i * (10 - i) } % 11]
      v[0] = v[0] < 2 ? 0 : 11 - v[0]
      v[1] = ((0..8).inject(0) { |sum, i| sum + cpf[i].to_i * (11 - i) } + v[0] * 2) % 11
      v[1] = v[1] < 2 ? 0 : 11 - v[1]
      cpf += v.join
    end

    def self.formatted(uf = nil)
      c = cpf(uf)
      '%03d.%03d.%03d-%02d' % [ c[0..2].to_i, c[3..5].to_i, c[6..8].to_i, c[9..10].to_i ]
    end

    private

    def self.uf_code(uf)
      data('codigo_uf')[uf.to_s.downcase].to_s
    end
  end
end