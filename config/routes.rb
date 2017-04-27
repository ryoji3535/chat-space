Rails.application.routes.draw do
  root "groups#index"
  resources :groups, except: [:index, :show] do
    resources :messages, only: [:index,:create]
  end
  devise_for :users
end
