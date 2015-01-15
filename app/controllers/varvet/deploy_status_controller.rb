module Varvet
  class DeployStatusController < ActionController::Base
    def index
      render text: "#{deploy_status} | Served by Rails from #{Socket.gethostname}"
    end

    private

    def deploy_status
      if File.exist?("deploy_status")
        File.read("deploy_status").strip
      else
        "ERROR: deploy_status file found"
      end
    end
  end
end
