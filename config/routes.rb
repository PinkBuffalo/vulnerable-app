Vulnerable::Application.routes.draw do
  resources :users, only: [:create, :show] do
    scope module: :user do
      resources :favorite_stories, only: [:index]
      resources :stories, only: [:index]
    end
  end
end
