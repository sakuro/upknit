begin
  require 'yard'
  require 'yard/rake/yardoc_task'

  YARD::Rake::YardocTask.new
rescue LoadError # rubocop:disable Lint/HandleExceptions
  # skip yard tasks
end
