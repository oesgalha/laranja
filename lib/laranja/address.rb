module Laranja
  class Address < Base

    def self.city
      strf [
        '%city_prefix :name%last_name',
        '%city_prefix :name%last_name %city_suffix',
        '%city_prefix %female_city_prefix :name%female_first_name',
        '%city_prefix %male_city_prefix :name%male_first_name',
        '%city_prefix %female_city_prefix :name%female_first_name %city_suffix',
        '%city_prefix %male_city_prefix :name%male_first_name %city_suffix',
        ':name%last_name %city_suffix',
        '%female_city_prefix :name%female_first_name',
        '%male_city_prefix :name%male_first_name',
        '%female_city_prefix :name%female_first_name %city_suffix',
        '%male_city_prefix :name%male_first_name %city_suffix'
      ].sample
    end

    def self.district
      strf [
        '%district_prefix :name%last_name',
        '%district_prefix :name%male_title :name%last_name',
        '%district_prefix :name%female_title :name%last_name'
      ].sample
    end

    def self.street
      strf [
        '%log_prefix :name%female_title :name%female_first_name :name%last_name',
        '%log_prefix :name%female_first_name :name%last_name',
        '%log_prefix :name%male_title :name%male_first_name :name%last_name :name%male_suffix',
        '%log_prefix :name%male_title :name%male_first_name :name%last_name',
        '%log_prefix :name%male_first_name :name%last_name :name%male_suffix',
        '%log_prefix :name%male_first_name :name%last_name'
      ].sample
    end

    def self.secondary
      strf '%secondary *###'
    end

    def self.number
      strf '*###'
    end

    def self.formatted_cep(ufab = nil)
      ufab.nil? ? strf('#####-###') : uf_code(ufab) + strf('####-###')
    end

    def self.cep(ufab = nil)
      ufab.nil? ? strf('########') : uf_code(ufab) + strf('#######')
    end

    def self.uf
      strf '%uf_name'
    end

    def self.uf_abbr
      strf '%uf_abbr'
    end

    private

    def self.uf_code(ufab)
      data('codigo_cep')[ufab.to_s.downcase].to_s
    end

  end
end