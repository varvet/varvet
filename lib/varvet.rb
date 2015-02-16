require "appsignal"
require "pry-byebug"
require "pry-rails"
require "unicorn"

module Varvet
  module Rails
    class Engine < ::Rails::Engine
    end

    class Railtie < ::Rails::Railtie
      config.before_initialize do
        if ::Rails.env.production?
          ::Rails.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
          ::Rails.logger.level = Logger.const_get("INFO")
        end
      end

      config.after_initialize do
        ::Rails.application.routes.prepend do
          get "deploy_status", to: "varvet/deploy_status#index"
        end
      end
    end
  end
end
