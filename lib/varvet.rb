require "appsignal"
require "lograge"
require "pry-byebug"
require "pry-rails"
require "unicorn"

module Varvet
  module Rails
    class Engine < ::Rails::Engine
    end

    class Railtie < ::Rails::Railtie
      config.before_configuration do
        if ::Rails.env.test?
          require "m"
          require "minitest/reporters"
          require "minitest"
          require "codeclimate-test-reporter"
        end

        if ::Rails.env.development?
          require "better_errors"
          require "binding_of_caller"
          require "meta_request"
        end

        if ::Rails.env.test? || ::Rails.env.development?
          require "dotenv-rails"
        end
      end

      config.before_initialize do
        if ::Rails.env.production?
          ::Rails.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
          ::Rails.logger.level = Logger.const_get("INFO")
          config.lograge.enabled = true
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
