require 'safe_yaml'
SafeYAML::OPTIONS[:default_mode] = :safe

module Laranja
  class Base

    NUMBERS = '0'.upto('9').to_a
    UPPER = 'A'.upto('Z').to_a
    LOWER = 'a'.upto('z').to_a

    def self.strf(format)
      symbolize(format).gsub(/(:(?<scope>[^:\s\z]+))?%(?<key>[^%\s\z]+)/) { data_sample($~[:key], $~[:scope]) }
    end

    protected

    #  # => Random digit between 0 and 9
    #  * => Random digit between 1 and 9
    #  & => Random number or letter
    def self.symbolize(format)
      f = format.gsub(/#/) { NUMBERS.sample }
      f = f.gsub(/\*/) { (1 + rand(9)).to_s }
      f = f.gsub(/&/) { (LOWER + UPPER + NUMBERS).sample }
    end

    def self.data_sample(key, scope = nil)
      data(key, scope).sample
    end

    def self.data(key, scope = nil)
      static_data[scope || to_s.split('::')[-1].downcase][key]
    end

    private

    def self.static_data
      @static_data ||= YAML.load_file(File.join(File.expand_path(File.dirname(__FILE__)), 'static_data.yml'))['laranja']
    end
  end
end

require 'laranja/address'
require 'laranja/document'
require 'laranja/gender'
require 'laranja/internet'
require 'laranja/name'
require 'laranja/version'