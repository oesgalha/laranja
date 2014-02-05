module Laranja
  class Base

    protected

    def self.static_data
      @static_data ||= YAML.load_file(File.join(File.expand_path(File.dirname(__FILE__)), 'laranja', 'static_data.yml'))['laranja']
    end
  end
end

require 'laranja/cpf'