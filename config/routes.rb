Rails.application.routes.draw do
  root 'apps#index'
  get 'admin', to: 'admin/schools#index'

  resources :apps, only: [:index]
  resources :users do
    collection do
      post 'signin'
      get 'signout'
      post 'reset'
      post 'send_captcha'
    end
  end

  namespace :admin do
    resources :schools, :users, :roles, :user_roles, :permissions
  end
end