Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  root to: 'posts#index'

  resources :users, :only =>[:index]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
