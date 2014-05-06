module Laranja
  class Name < Base

    def self.name(last_names = 1)
      strf [
        '%female_first_name ' + ('%last_name ' * last_names),
        '%male_first_name ' + ('%last_name ' * last_names),
        '%female_first_name ' + ('%last_name ' * last_names) + '%female_suffix',
        '%male_first_name ' + ('%last_name ' * last_names) + '%male_suffix',
      ].sample
    end

    def self.first_name
      strf [
        '%female_first_name',
        '%male_first_name'
      ].sample
    end

    def self.last_name
      strf '%last_name'
    end
  end
end