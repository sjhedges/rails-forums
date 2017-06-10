Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/show'

  get 'comments/edit'

  get 'comments/new'

  get 'posts/index'

  get 'posts/show'

  get 'posts/edit'

  get 'posts/new'

  get 'catagories/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
