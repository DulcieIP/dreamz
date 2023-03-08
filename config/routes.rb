Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get :dreamboard, to: "pages#dreamboard"

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dreams do
    resources :scenes
    member do
      patch :filtered_scene
    end
  end

end
