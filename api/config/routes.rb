Forge::Api::Engine.routes.draw do
  scope module: 'api', path: 'api' do
    scope module: 'v1', path: 'v1' do

      mount_devise_token_auth_for 'Forge::User', at: 'auth', controllers: {
         confirmations:      'forge/api/v1/auth/confirmations',
         passwords:          'forge/api/v1/auth/passwords',
         omniauth_callbacks: 'forge/api/v1/auth/omniauth_callbacks',
         registrations:      'forge/api/v1/auth/registrations',
         sessions:           'forge/api/v1/auth/sessions',
         token_validations:  'forge/api/v1/auth/token_validations'
      }

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
