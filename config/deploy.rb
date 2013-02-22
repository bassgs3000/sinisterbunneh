require "bundler/capistrano"

# RVM Capistrano Integration Code ##############################################
set :rvm_ruby_string, 'ruby-1.9.3-p327@global'
set :rvm_type, :system
set :rvm_install_pkgs, %w[libyaml openssl]
set :rvm_install_ruby_params, '--with-opt-dir=/usr/local/rvm/usr'

before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'
before 'deploy:setup', 'rvm:install_pkgs'

################################################################################
require "rvm/capistrano"

# Git and Server Information ###################################################
ssh_options[:forward_agent] = true
set :application, "sinisterbunneh"
set :scm, :git
set :repository, "git@github.com:bassgs3000/sinisterbunneh.git"
set :branch, "deploy"
set :scm_passphrase, ""
set :deploy_via, :remote_cache
set :keep_releases, 10
set :user, "root"
set :normalize_asset_timestamps, false

# Target Server Information
server "www.sinisterbunneh.com", :app, :web, :db, :primary => true
set :deploy_to, "/var/www/sinisterbunneh"
set :rails_env, :production
################################################################################

# Named Tasks ##################################################################
namespace :db do
  task :db_config, :except => { :no_release => true }, :role => :app do
    run "cp -f ~/DB/#{application}/database.yml #{release_path}/config/database.yml"
  end
end

namespace :deploy do
  task :precompile, :role => :app do
    run "cd #{release_path}/ && RAILS_ENV=production rake db:create"
    run "cd #{release_path}/ && rake assets:precompile"
  end
end

after "deploy", "db:db_config"
after "deploy", "deploy:precompile"
