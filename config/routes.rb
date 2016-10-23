Rails.application.routes.draw do

  resources :cats do
    resources :logs
  end
  root 'home#index'
end
