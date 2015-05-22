module Laranja
  class Generator
    class << self
      attr_writer :static_data

      NUMBERS = '0'.upto('9').to_a
      UPPER = 'A'.upto('Z').to_a
      LOWER = 'a'.upto('z').to_a

      protected

      def strf(format)
        symbolize(format).gsub(/(:(?<scope>[^:\s\z]+))?%(?<key>[^%\s\z]+)/) do
          data_sample($~[:key], $~[:scope])
        end
      end

      def symbolize(format)
        format.gsub(/#/) {
          NUMBERS.sample
        }.gsub(/\*/) {
          (1 + rand(9)).to_s 
        }.gsub(/&/) { 
          (LOWER + UPPER + NUMBERS).sample 
        }
      end

      def data_sample(key, scope = nil)
        data(key, scope).sample
      end

      def data(key, scope = nil)
        static_data[scope || to_s.split('::')[-1].downcase][key]
      end

      private

      def static_data
        @static_data ||= YAML.load_file(File.join(File.expand_path(File.dirname(__FILE__)), 'data', "#{Laranja.locale}.yml"))
      end
    end
  end
end
