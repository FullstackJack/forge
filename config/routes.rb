Forgecms::Engine.routes.draw do

  # devise_for :user, class_name: "Forgecms::User", module: :users, controllers: {
  #   confirmations:  'forgecms/users/confirmations',
  #   passwords:      'forgecms/users/passwords',
  #   registrations:  'forgecms/users/registrations',
  #   sessions:       'forgecms/users/sessions',
  #   unlocks:        'forgecms/users/unlocks'
  # }

  scope :api do
    scope :v1 do
      mount_devise_token_auth_for 'Forgecms::User', at: 'auth'

      get '/', to: 'dashboard#index', as: :dashboard
      resources :posts
      resources :users
    end
  end

  devise_scope :user do
    get "/signup" => "/forgecms/users/registrations#new"
    get "/login" => "/forgecms/users/sessions#new"
    get "/logout" => "/forgecms/users/sessions#destroy"
  end


end
