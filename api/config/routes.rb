Forge::Api::Engine.routes.draw do
  scope module: 'api', path: 'api' do
    scope module: 'v1', path: 'v1' do

      mount_devise_token_auth_for 'Forge::Api::User', at: 'auth'

      get '/', to: 'dashboard#index', as: :dashboard
      resources :posts
      resources :users
    end
  end

  devise_scope :user do
    get "/signup" => "/forge/api/users/registrations#new"
    get "/login" => "/forge/api/users/sessions#new"
    get "/logout" => "/forge/api/users/sessions#destroy"
  end


end
