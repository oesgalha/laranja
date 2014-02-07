module Laranja
  class Address < Base

    def self.strfcep(formatted, suffix = true, ufab = nil)
      c = unufy(ufab, 'U####')
      c += '-' if formatted
      c += suffix ? '###' : '000'
      c.gsub(/#/) { rand(10).to_s }
    end

    def self.formatted_cep(ufab = nil)
      strfcep(true, rand(6) != 0, ufab)
    end

    def self.cep(ufab = nil)
      strfcep(false, rand(6) != 0, ufab)
    end

    def self.uf
      specified '%uf_name'
    end

    def self.uf_abbr
      specified '%uf_abbr'
    end

    private

    def self.unufy(ufab, str)
      str.sub(/U/, ufab.nil? ? '#' : data('codigo_cep')[ufab.to_s.downcase].to_s)
    end

  end
end