Forgecms::Engine.routes.draw do

  devise_for :user, class_name: "Forgecms::User", module: :users, controllers: {
    registrations: 'users/registrations'
  }

  scope :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :posts
  end

  devise_scope :user do
    get "/signup" => "/users/registrations#new"
    get "/login" => "/users/sessions#new"
    get "/logout" => "/users/sessions#destroy"
  end


end
