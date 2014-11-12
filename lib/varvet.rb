require "seedbank"
require "thor"
require "unicorn"
require "varvet/version"

module Varvet
  class Command < Thor
    desc "new", "Creates a new Rails project using the Varvet template"
    def new(name)
      system("rails new #{name} --database=mysql --template=#{template_path}")
    end

    desc "update", "Updates the Rails project with the latest Varvet template"
    def update
      system("rake rails:template LOCATION=#{template_path}")
    end

    private

    def template_path
      File.expand_path("../template.rb", File.dirname(__FILE__))
    end
  end
end
