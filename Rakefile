begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE = File.join(__dir__, 'spec/dummy/Rakefile')
load 'rails/tasks/engine.rake'

load 'rails/tasks/statistics.rake'

require 'bundler/gem_tasks'

load 'rspec/rails/tasks/rspec.rake'

Dir['lib/tasks/*.rake'].each(&method(:load))
