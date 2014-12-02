set :application, "FIXME"
set :repo_url,  "git@github.com:varvet/FIXME.git"

set :ssh_options, {
  user: 'deploy'
}

set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/#{fetch(:application)}"

set :assets_roles, [:app] #defaults to :web
set :migration_role, :migrator

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
    invoke 'deploy:status'
  end

  task :full_restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
    invoke 'deploy:status'
  end

  task :stop do
    invoke 'unicorn:stop'
  end

  task :start do
    invoke 'unicorn:start'
  end
end

after 'deploy:finished', 'deploy:set_current_version'

after 'deploy', 'deploy:restart'
