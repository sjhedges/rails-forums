Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :posts
  end

  resources :posts do
    resources :comments
  end
end
