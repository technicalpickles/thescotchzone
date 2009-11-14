desc "Default: run all tests, including features"
task :default => [ 'test' ] 

TITLE_ESTUARY_PROJECT_ROOT = File.expand_path(File.dirname(__FILE__))
LOAD_TITLE_ESTUARY_BUILD_TASKS = true

Dir.glob('tasks/*.task').each do |taskfile|
  load File.expand_path("./#{taskfile}")
end
