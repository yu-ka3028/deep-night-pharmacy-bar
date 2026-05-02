Rails.application.routes.draw do
  root "topics#show"

  resources :prescriptions, only: [:create, :show]
  resources :side_effects, only: [:new, :create]
  resources :side_effect_reports, only: [:show]
end
