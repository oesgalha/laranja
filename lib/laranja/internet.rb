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

    def self.password(min = 8, max = 128)
      characters = ('0'.upto('9').to_a + 'A'.upto('Z').to_a + 'a'.upto('z').to_a)
      size = min + rand(max - min)
      (1..size).inject('') { |passcode, i| passcode + characters.sample }
    end
  end
end