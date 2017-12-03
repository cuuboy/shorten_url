Rails.application.routes.draw do
  root 'shortcuts#new'

  resources :shortcuts do
    member do
      get :redirect
    end
  end

  get 'goto/:shorten_url', to: 'shortcuts#redirect', as: :redirect_to_origin

  resources :visits, only: [:index, :show]
end
