require "seedbank"
require "thor"
require "unicorn"
require "varvet/version"
require "yaml"

module Varvet
  class VarvetConfig
    def self.config()
      defaults = YAML.load_file("#{VarvetConfig.gem_root}/config/default_config.yml")
      local_config = YAML.load_file("config/varvet.yml")
      defaults.merge(local_config)
    end

    def self.gem_root
      "#{File.dirname(__FILE__)}/.."
    end
  end

  class Command < Thor
    include Thor::Actions

    desc "new", "Creates a new Rails project using the Varvet template"
    def new(name)
      system("rails new #{name} --database=mysql --template=#{template_path}")
    end

    desc "update", "Updates the Rails project with the latest Varvet template"
    def update
      system("bundle exec rake rails:template LOCATION=#{template_path}")
    end

    desc "deploy", "Deploys the application to the specified environment"
    def deploy(env)
      system("bundle exec cap #{env} deploy")
    end

    desc "postdeploy ENV", "Runs on servers after deploy"
    def postdeploy(env)
      Command.source_root("#{gem_root}/deploy_files")
      @config =  VarvetConfig.config
      files = ['Procfile','.foreman','config/unicorn.rb']
      files.each do |f|
        template(f)
      end
      create_file '.env', "RAILS_ENV=#{env}\n"
      service_dir = File.join(ENV['HOME'],'service')
      run "foreman export runit #{service_dir}"

    end

    private

    def fetch(key)
      @config.fetch(key.to_s)
    end

    def gem_root
      Varvet::VarvetConfig.gem_root
    end

    def template_path
      File.expand_path("../template.rb", File.dirname(__FILE__))
    end
  end
end
