# config valid for current version and patch releases of Capistrano
lock "~> 3.11.1"

set :application, "blog_andy"
set :repo_url, "https://github.com/andybit-okutama/andy1dx.com.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, '/home/deploy/blog_andy'
# Default value for :format is :airbrussh.
# set :format, :airbrussh

set :rvm_ruby_version, '2.6.0'
set :passenger_restart_with_touch, true
# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto
# config valid only for current version of Capistrano

set :branch, :master
set :pty, true
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :root


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
