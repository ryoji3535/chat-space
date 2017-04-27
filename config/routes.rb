Rails.application.routes.draw do
  root "messages#index"
  resources :groups, except: [:index, :show]
  devise_for :users
end
