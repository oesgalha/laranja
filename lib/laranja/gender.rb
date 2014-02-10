module Laranja
  class Gender < Base

    def self.gender
      strf '%name'
    end

    def self.abbr
      strf '%abbr'
    end
  end
end