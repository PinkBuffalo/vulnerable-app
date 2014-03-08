Vulnerable::Application.routes.draw do
  scope 'api/v1', defaults: { format: 'json' } do
    resources :users, only: [:create, :show] do
      scope module: :users do
        resources :favorite_stories, only: [:index, :create, :destroy]
        resources :stories, only: [:index, :create]
      end
    end

    match '/users', via: :options, to: 'stories#index'
    get 'timeline', to: 'stories#index'
  end
end
