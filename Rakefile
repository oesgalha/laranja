require 'bundler/gem_tasks'

task :spec do
  $LOAD_PATH.unshift('lib', 'spec')
  Dir.glob('./spec/**/*_spec.rb') { |f| require f }
end

task default: :spec
