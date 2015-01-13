require "seedbank"
require "unicorn"

module Varvet
  module Rails
    class Railtie < ::Rails::Railtie
      config.before_initialize do
        if Rails.env.production?
          ::Rails.logger = Logger.new(STDOUT)
          ::Rails.logger.level = Logger.const_get("INFO")
        end
      end
    end
  end
end
