Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :groups, except: [:index, :show] do
    resources :messages, only: [:index,:create]
  end
end
