module Laranja
  class Endereco < Generator
    class << self
      def cidade
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

      def bairro
        strf [
          '%district_prefix :name%last_name',
          '%district_prefix :name%male_title :name%last_name',
          '%district_prefix :name%female_title :name%last_name'
        ].sample
      end

      def rua
        strf [
          '%log_prefix :name%female_title :name%female_first_name :name%last_name',
          '%log_prefix :name%female_first_name :name%last_name',
          '%log_prefix :name%male_title :name%male_first_name :name%last_name :name%male_suffix',
          '%log_prefix :name%male_title :name%male_first_name :name%last_name',
          '%log_prefix :name%male_first_name :name%last_name :name%male_suffix',
          '%log_prefix :name%male_first_name :name%last_name'
        ].sample
      end

      def complemento
        strf '%secondary *###'
      end

      def numero
        strf '*###'
      end

      def cep_formatado(ufab = nil)
        ufab.nil? ? strf('#####-###') : uf_code(ufab) + strf('####-###')
      end

      def cep(ufab = nil)
        ufab.nil? ? strf('########') : uf_code(ufab) + strf('#######')
      end

      def uf
        strf '%uf_name'
      end

      def uf_sigla
        strf '%uf_abbr'
      end

      private

      def uf_code(ufab)
        data('codigo_cep')[ufab.to_s.downcase].to_s
      end
    end
  end
end
