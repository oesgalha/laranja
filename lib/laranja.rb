require 'safe_yaml'
SafeYAML::OPTIONS[:default_mode] = :safe

module Laranja
  class Base

    def self.strf(format)
      format.gsub(/(:(?<scope>[^:\s\z]+))?%(?<key>[^%\s\z]+)/) { data_sample($~[:key], $~[:scope]) }
    end

    protected

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
require 'laranja/cpf'
require 'laranja/gender'
require 'laranja/internet'
require 'laranja/name'
require 'laranja/version'