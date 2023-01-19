Rails.application.routes.draw do
  root "movies#index"

  resources :movies
end
