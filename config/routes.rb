Rails.application.routes.draw do
  root "messages#index"
  resources :groups, :except => [:index, :show, :update]
  get '/groups/:id', to: 'groups#update'
  devise_for :users
end
