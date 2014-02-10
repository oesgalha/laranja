module Laranja
  class Name < Base

    def self.name(last_names = 1)
      strf format_builder(Laranja::Gender.abbr, last_names, rand(9) == 0)
    end

    def self.first_name
      strf format_builder(Laranja::Gender.abbr, 0)
    end

    def self.last_name
      strf format_builder(Laranja::Gender.abbr, 1, false, false)
    end

    private

    def self.format_builder(gender, last_names = 1, suffix = false, first_name = true)
      f = ''
      f += genderfy(gender, 'first_name ') if first_name
      f += '%last_name ' * last_names
      # TODO: Only men have suffix?
      f += genderfy(gender, 'suffix ') if suffix && gender.downcase == 'm'
      f
    end

    def self.genderfy(gender, attribute)
      g = gender.downcase == 'f' ? 'female' : 'male'
      "%#{g}_#{attribute}"
    end

  end
end