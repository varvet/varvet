require "appsignal"
require "lograge"
require "unicorn"

module Varvet
  module Rails
    class Engine < ::Rails::Engine
    end

    class Railtie < ::Rails::Railtie
      if ::Rails.env.test? || ::Rails.env.development?
        require "dotenv-rails"
      end

      config.before_initialize do
        if ::Rails.env.production?
          ::Rails.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
          ::Rails.logger.level = Logger.const_get("INFO")
          config.lograge.enabled = true
          config.lograge.custom_options = lambda do |event|
            exceptions = %w(controller action format id)
            {
              params: event.payload[:params].except(*exceptions)
            }
          end

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
