require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/rvm'    # for rvm support. (http://rvm.io)
# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :app,         'hrm-system'
set :domain,      'lsong.org'
set :deploy_to,   '/home/lsong/hrm-system'
set :repository,  'https://lsong.org/~git/hrm-system.git'
set :branch,      'master'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'log']

# Optional settings:
set :user, 'lsong'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.

set :app_path, "#{deploy_to}/#{current_path}"
set :unicorn_config, "#{app_path}/config/unicorn.rb"
set :unicorn_pid, "#{app_path}/tmp/pids/unicorn.pid"

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/{pids,sockets}"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/{pids,sockets}"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      #queue "touch #{deploy_to}/tmp/restart.txt"
      #invoke :'unicorn:restart'unicorn_rails 
      invoke :'unicorn:restart'
    end
  end
end

#                                                                       Unicorn
# ==============================================================================
namespace :unicorn do
#                                                                    Start task
# ------------------------------------------------------------------------------
  desc "Start unicorn"
  task :start => :environment do
    queue 'echo "-----> Start Unicorn"'
    queue! %{
      cd #{app_path}
      RAILS_ENV=production bundle exec unicorn_rails -c #{unicorn_config} -D
    }
  end
 
#                                                                     Stop task
# ------------------------------------------------------------------------------
  desc "Stop unicorn"
  task :stop do
    queue 'echo "-----> Stop Unicorn"'
    queue! %{
      test -s #{unicorn_pid} && kill -QUIT `cat "#{unicorn_pid}"` && echo "\tStop Ok" && exit 0
      echo >&2 "\tNot running"
    }
  end
 
#                                                                  Restart task
# ------------------------------------------------------------------------------
  desc "Restart unicorn"
  task :restart => :environment do
    #invoke 'unicorn:stop'
    #invoke 'unicorn:start'
    queue 'echo "-----> Restart Unicorn"'
    queue! %{
      test -s #{unicorn_pid} && kill -s USR2 `cat #{unicorn_pid}` 
      exit 0
    }
  end
end
# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

