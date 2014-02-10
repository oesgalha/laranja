module Laranja
  class Address < Base

    def self.formatted_cep(ufab = nil)
      cep_builder(true, rand(6) != 0, ufab)
    end

    def self.cep(ufab = nil)
      cep_builder(false, rand(6) != 0, ufab)
    end

    def self.uf
      strf '%uf_name'
    end

    def self.uf_abbr
      strf '%uf_abbr'
    end

    private

    def self.cep_builder(formatted, suffix = true, ufab = nil)
      c = unufy(ufab, 'U####')
      c += '-' if formatted
      c += suffix ? '###' : '000'
      c.gsub(/#/) { rand(10).to_s }
    end

    def self.unufy(ufab, str)
      str.sub(/U/, ufab.nil? ? '#' : data('codigo_cep')[ufab.to_s.downcase].to_s)
    end

  end
end