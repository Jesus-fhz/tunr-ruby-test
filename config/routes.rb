Rails.application.routes.draw do
  
  # get 'mixtapes/new'
  # get 'mixtapes/create'
  # get 'mixtapes/index'
  # get 'mixtapes/show'
  # get 'mixtapes/edit'
  # get 'mixtapes/update'
  # get 'mixtapes/destroy'
  root to: 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' =>'session#destroy'  #Destroy session(log out)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mixtapes
end
