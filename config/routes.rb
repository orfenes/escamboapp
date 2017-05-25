Rails.application.routes.draw do

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail, only: [:edit, :create]
    resources :categories, except: [:show, :destroy]
    resources :admins, except: [:show]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
   get 'home', to:'home#index'

   namespace :profile do
    resources :dashboard, only: [:index]
   end

  end


  devise_for :admins, :skip => [:registrations]
  devise_for :members

  root 'site/home#index'

end
