require 'safe_yaml'
SafeYAML::OPTIONS[:default_mode] = :safe
require 'laranja/version'

module Laranja

  class << self
    attr_accessor :locale
  end

  def self.load(locale = nil)
    self.locale = locale || I18n.locale
    require 'laranja/generator'
    Dir.glob(File.dirname(__FILE__) + "/laranja/generators/#{locale}/*.rb") { |f| require f }
  end
end
