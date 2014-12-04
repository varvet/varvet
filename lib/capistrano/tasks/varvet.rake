require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/deploy_status'
require 'varvet'

def create_runit_task(ps)
  namespace :runit do
    namespace ps do
      [:restart,:stop,:start,:reload,:status].each do |cmd|
        desc "#{cmd} #{ps}"
        task cmd do
          on roles(:all) do |host|
            execute "sv #{cmd.to_s} /home/deploy/service/#{fetch(:application)}-#{ps.to_s}-1"
          end
        end
      end
    end
  end
end

config = Varvet::VarvetConfig.config
set :application, config.fetch('application')
set :repo_url,  config.fetch('repo_url')

set :ssh_options, {
  user: 'deploy'
}

set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/#{fetch(:application)}"

set :assets_roles, [:app] #defaults to :web
set :migration_role, :migrator

create_runit_task(:web)

namespace :deploy do
  task :runit do
    on roles(:all) do |host|
      execute "cd #{release_path} && bundle exec varvet postdeploy #{fetch(:rails_env)}"
      invoke 'runit:web:restart'
      3.times do |i|
        begin
          puts 'waiting on restart to finish..'
          sleep i
          invoke 'deploy:status'
          break
        rescue Exception  => e
          puts "try #{i+1}/3 failed."
          Rake::Task["deploy:status"].reenable
        end
      end
    end
  end
end



after 'deploy:finished', 'deploy:set_current_version'
after 'deploy:finished', 'deploy:runit'

