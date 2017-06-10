Rails.application.routes.draw do
  root 'categories#index'
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :categories do
    resources :posts
  end

 resources :posts do
    resources :comments
  end
end
