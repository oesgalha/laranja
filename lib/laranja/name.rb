module Laranja
  class Name < Base

    def self.strfname(last_names = 1, suffix = false, first_name = true)
      f = ''
      f += '%first_name' if first_name
      f += ' %last_name' * last_names
      f += ' %suffix' if suffix
      specified f.strip
    end

    def self.name(last_names = 1)
      strfname last_names, rand(9) == 0
    end

    def self.first_name
      strfname 0
    end

    def self.last_name
      strfname 1, false, false
    end

  end
end