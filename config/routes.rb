Rails.application.routes.draw do
  get "deploy_status", to: "varvet/deploy_status#index"
end
