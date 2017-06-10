Rails.application.routes.draw do
  get 'omniauth_callbacks/index'

  get 'home/indexw'

  root 'categories#index'
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :categories do
    resources :posts
  end

 resources :posts do
    resources :comments
  end
end
