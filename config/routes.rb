Rails.application.routes.draw do
  root 'shortcuts#new'

  resource :shortcuts
end
