Rails.application.routes.prepend do
  get "deploy_status", to: "varvet/deploy_status#index"
end
