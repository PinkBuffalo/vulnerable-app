Vulnerable::Application.routes.draw do
  resources :users, only: [:create, :show]
end
