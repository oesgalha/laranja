module Laranja
  class Internet < Base

    def self.email_for(name)
      strf username_for(name) + '@%email'
    end

    def self.email
      email_for(Laranja::Name.name)
    end

    def self.username_for(name, sep = ['', '.', '_'])
      name.gsub(/[^a-zA-Z0-9\s]/, '').split.join(sep.sample).downcase
    end

    def self.username
      username_for(Laranja::Name.name)
    end

    def self.password(min = 8, max = 128)
      strf '&' * (min + rand(max - min))
    end
  end
end