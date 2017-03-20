Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portofolioos, except: [:show] do
    put :sort, on: :collection
  end
  get 'portofolioo/:id', to: 'portofolioos#show', as: 'portofolioo_show'
  get 'angular-items', to: 'portofolioos#angular'
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do 
    member do
      get :toggle_status
    end
  end
  
  root to: 'pages#home'
end
