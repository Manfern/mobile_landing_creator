# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'mobile_landing_creator'
set :repo_url, 'git@github.com:Manfern/mobile_landing_creator.git'
# Default branch is :master
set :scm, 'git'
set :branch, "capistrano_deploy"
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/apps/mobile_landing_creator'
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :user, "deploy"
set :use_sudo, true
set :deploy_via, :remote_cache
set :keep_releases, 3

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

  namespace :deploy do
    # config for unicorn and nginx
    %w[start stop restart].each do |command|
      desc "#{command} unicorn server"
      task command, roles: :app, except: {no_release: true} do
        run "/etc/init.d/unicorn_#{application} #{command}"
      end
    end

    task :setup_config, roles: :app do
      sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
      sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
      run "mkdir -p #{shared_path}/config"
      put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
      puts "Now edit the config files in #{shared_path}."
    end

    after "deploy:setup", "deploy:setup_config"
    # end of config for unicorn and nginx
    desc 'Restart application'
    task :restart do
      on roles(:app), in: :sequence, wait: 5 do
        execute :touch, release_path.join('tmp/restart.txt')
      end
    end

    after :publishing, 'deploy:restart'
    after :finishing, 'deploy:cleanup'
  end

