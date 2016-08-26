# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'mobile_landing_creator'
set :repo_url, 'git@github.com:Manfern/mobile_landing_creator.git'
# Default branch is :master
set :scm, 'git'
set :branch, "capistrano_deploy"
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/apps/mobile_landing_creator'
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :user, "deploy"
set :use_sudo, true

  namespace :deploy do

    desc 'Restart application'
    task :restart do
      on roles(:app), in: :sequence, wait: 5 do
        execute :touch, release_path.join('tmp/restart.txt')
      end
    end

    after :publishing, 'deploy:restart'
    after :finishing, 'deploy:cleanup'
  end

