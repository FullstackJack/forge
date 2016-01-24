Forgecms::Engine.routes.draw do

  devise_for :user, class_name: "Forgecms::User", module: :users, controllers: {
    confirmations:  'forgecms/users/confirmations',
    passwords:      'forgecms/users/passwords',
    registrations:  'forgecms/users/registrations',
    sessions:       'forgecms/users/sessions',
    unlocks:        'forgecms/users/unlocks'
  }

  scope :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :posts
  end

  devise_scope :user do
    get "/signup" => "/forgecms/users/registrations#new"
    get "/login" => "/forgecms/users/sessions#new"
    get "/logout" => "/forgecms/users/sessions#destroy"
  end


end
