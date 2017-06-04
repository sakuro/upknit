begin
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new
rescue LoadError
  # skip rubocop tasks
end
