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
          ::Rails.logger = Logger.new(STDOUT)
          ::Rails.logger.level = Logger.const_get("INFO")
        end
      end
    end
  end
end
