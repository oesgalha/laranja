module Laranja
  class Internet < Base

    def self.strfemail(name)
      specified strfusername(name) + '@%email'
    end

    def self.email
      strfemail(Laranja::Name.name)
    end

    def self.strfusername(name, sep = ['', '.', '_'])
      name.gsub(/[^a-zA-Z0-9\s]/, '').split.join(sep.sample).downcase
    end

    def self.username
      strfusername(Laranja::Name.name)
    end
  end
end