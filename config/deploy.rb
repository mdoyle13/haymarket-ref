#configure for a multistage deployment

require 'capistrano/ext/multistage'
require "rvm/capistrano"
require "bundler/capistrano"

set :stages, %w(staging production)

set :application, 'haymarket-ref'

set :user, "hmb"
set :use_sudo, false

set :repository,  "git://github.com/mdoyle13/haymarket-ref.git"
set :scm, :git
set :deploy_via, :remote_cache

role :web, "184.106.71.81"                          # Your HTTP server, Apache/etc
role :app, "184.106.71.81"                          # This may be the same as your `Web` server
role :db,  "184.106.71.81", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# symlink rails configs

task :symlink_database_yml do
	run "ln -s #{deploy_to}/#{shared_dir}/config/database.yml #{current_release}/config/database.yml"
end

task :symlink_singleplatform_yml do
	run "ln -s #{deploy_to}/#{shared_dir}/config/singleplatform.yml #{current_release}/config/singleplatform.yml"
end

after "deploy:update_code", :symlink_database_yml
after "deploy:update_code", :symlink_singleplatform_yml

after "deploy", "deploy:cleanup"