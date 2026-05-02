Rails.application.routes.draw do
  root "pages#top"
  get "/play", to: "topics#show", as: :play

  resources :prescriptions, only: [:create, :show]
  resources :side_effects, only: [:new, :create]
  resources :side_effect_reports, only: [:show]
end
