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

    self.singleton_class.send(:alias_method, :number_only, :cpf)

    private

    def self.uf_code(uf)
      static_data['cpf']['codigo_uf'][uf.to_s.downcase].to_s
    end
  end
end