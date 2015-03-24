Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json}, :constraints => {:subdomain => "api"} do
    namespace :v1 do
      resources :url, only: [:index, :create]
    end
  end

  get "/:short", to: "router#show"
end
