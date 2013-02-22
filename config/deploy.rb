require "bundler/capistrano"

# Git and Server Information ###################################################
#default_run_options[:shell] = '/bin/bash'
default_run_options[:pty] = false
ssh_options[:forward_agent] = true

set :ruby_version, "1.9.3-p327"
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
  desc "Copies a prefilled database.yml to the current revision"
  task :db_config, :except => { :no_release => true }, :role => :app do
    run "cp -f ~/DB/#{application}/database.yml #{release_path}/config/database.yml"
  end
end

namespace :rbenv do
  desc "Installs rbenv to server"
  task :install do
    run "git clone git://github.com/sstephenson/rbenv.git ~/.rbenv"
    run "git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
    run "echo 'export PATH=\"$HOME/.rbenv/bin:$PATH\"' >> ~/.profile"
    run "echo 'eval \"$(rbenv init -)\"' >> ~/.profile"
    run "rbenv install #{ruby_version}"
    run "rbenv rehash"
  end

  desc "Updates existing rbenv installation"
  task :update do
    run "cd ~/.rbenv && git pull"
    run "rbenv rehash"
  end

  desc "Rehashes rbenv"
  task :rehash do
    run "rbenv rehash"
  end
end

namespace :deploy do
  desc "Creates the production database and precompiles assets"
  task :precompile, :role => :app do
    run "cd #{release_path}/ && RAILS_ENV=production rake db:create"
    run "cd #{release_path}/ && rake assets:precompile"
  end
end

#before "setup", "rbenv:install"
#after "rbenv:install", "rbenv:rehash"
#before "bundle:install", "rbenv:rehash"
after "deploy", "db:db_config"
after "deploy", "deploy:precompile"