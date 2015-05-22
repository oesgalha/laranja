module Laranja
  class Endereco < Generator
    class << self
      def cidade
        strf [
          '%city_prefix :nome%last_name',
          '%city_prefix :nome%last_name %city_suffix',
          '%city_prefix %female_city_prefix :nome%female_first_name',
          '%city_prefix %male_city_prefix :nome%male_first_name',
          '%city_prefix %female_city_prefix :nome%female_first_name %city_suffix',
          '%city_prefix %male_city_prefix :nome%male_first_name %city_suffix',
          ':nome%last_name %city_suffix',
          '%female_city_prefix :nome%female_first_name',
          '%male_city_prefix :nome%male_first_name',
          '%female_city_prefix :nome%female_first_name %city_suffix',
          '%male_city_prefix :nome%male_first_name %city_suffix'
        ].sample
      end

      def bairro
        strf [
          '%district_prefix :nome%last_name',
          '%district_prefix :nome%male_title :nome%last_name',
          '%district_prefix :nome%female_title :nome%last_name'
        ].sample
      end

      def rua
        strf [
          '%log_prefix :nome%female_title :nome%female_first_name :nome%last_name',
          '%log_prefix :nome%female_first_name :nome%last_name',
          '%log_prefix :nome%male_title :nome%male_first_name :nome%last_name :nome%male_suffix',
          '%log_prefix :nome%male_title :nome%male_first_name :nome%last_name',
          '%log_prefix :nome%male_first_name :nome%last_name :nome%male_suffix',
          '%log_prefix :nome%male_first_name :nome%last_name'
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
