# Load DSL and set up stages


# Include default deployment tasks

# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rbenv'
require 'capistrano/puma'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
set :rbenv_ruby, '2.3.1'
# require 'capistrano3/unicorn'

# Load custom tasks from `lib/capistrano/tasks' if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
