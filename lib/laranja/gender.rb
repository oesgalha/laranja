module Laranja
  class Gender < Base

    def self.gender
      specified '%name'
    end

    def self.abbr
      specified '%abbr'
    end
  end
end