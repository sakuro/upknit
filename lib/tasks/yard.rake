begin
  require 'yard'
  require 'yard/rake/yardoc_task'

  YARD::Rake::YardocTask.new
rescue LoadError
  # skip yard tasks
end
