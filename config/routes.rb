Rails.application.routes.draw do
  root 'shortcuts#new'

  resources :shortcuts

  get 'goto/{shorten_url}', to: 'shortcuts#redirect'

  resources :visits, only: [:index, :show]
end
