Rails.application.routes.draw do
  post 'messges', to:  'messges#create'

  delete 'posts/:id', to: 'posts#destroy', as: :delete_post
  get 'walls/index'
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :walls
  resources :messges

  root to: 'home#index'
end
