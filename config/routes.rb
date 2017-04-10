Rails.application.routes.draw do
  root "messages#index"
  resources :groups, :except => [:index]
  devise_for :users
end
