Rails.application.routes.draw do
  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'
  # resources :users

root 'posts#index', as: 'home'

get 'sign_in', to: 'sessions#new'
delete 'sign_out', to: 'sessions#destroy'

resources :sessions, only: [:create]
  # resources :posts, :path_names => { :index => 'home' }

resources :users do
    resources :posts
  end

  # map.resources :photos, :path_names => { :new => 'make', :edit => 'change' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
