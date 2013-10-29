BarhopApp::Application.routes.draw do
  root :to => 'pages#home'

  get '/login' => 'session#user_new'
  post '/login' => 'session#user_create'
  delete '/login' => 'session#user_destroy'
  get '/companies/login' => 'session#companies_new'
  post '/companies/login' => 'session#companies_create'
  delete '/companies/login' => 'session#company_destroy', as: :company_login



  resources :users, :except => [:edit]  do  #here we allow users to only edit thier profile
    collection do                           #we want /companies/edit , no id
      get 'edit'
      get 'show'
    end
  end

  resources :companies, :except => [:edit]  do
    collection do
      get 'edit'
      get 'show'
    end
  end

  resources :bars, :wishlists

end