BarhopApp::Application.routes.draw do
  root :to => 'pages#home'

  get '/login' => 'session#user_new'
  post '/login' => 'session#user_create'
  delete '/login' => 'session#user_destroy'
  get '/companies/login' => 'session#company_new'
  post '/companies/login' => 'session#company_create'
  delete '/companies/login' => 'session#company_destroy', as: :company_login



  resources :users, :except => [:edit]  do  #here we allow users to only edit their profile
    collection do                           #we want /companies/edit , no id
      get 'edit'
      get 'show'
    end
  end

  resources :companies

  resources :bars, :wishlists

  resources :company_bars, :except => [:index]


end