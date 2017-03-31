Rails.application.routes.draw do
  namespace :site do
   get 'home', to:'home#index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
  end

  devise_for :admins
  devise_for :members

  root 'site/home#index'

end
