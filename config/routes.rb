Vulnerable::Application.routes.draw do
  resources :users, only: [:create, :show] do
    scope module: :users do
      resources :favorite_stories, only: [:index]
      resources :stories, only: [:index, :create]
    end
  end

  get 'timeline', to: 'stories#index'
end
