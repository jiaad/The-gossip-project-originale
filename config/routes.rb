Rails.application.routes.draw do

  get 'sesssions/new'
  get 'sesssions/create'
  get 'sesssions/destroy'
  get 'user/create'
  get 'user/new'
  get '/', to: 'home_page#index'

  get 'gossips/user/:user_id', to: 'user_page#user_show'
  #get '/gossip', to: 'gossip_page#show_gossip'
  #get'/gossip/:gossip_id', to: 'gossip_page#gossip_by_id'
  get 'welcome/:first_name', to: 'welcome_page#welcome'
  get 'contact' , to: 'contact_page#contact'
  get 'team' , to: 'team_page#team'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips , only: [:new , :create, :show, :index, :edit, :update, :destroy] do

    resources :comments , only:[:new, :create, :show, :edit, :update, :destroy]
  end

  
  resources :city , only: [:show]
  get '/signup', to: 'user#new'
  post '/user', to: 'user#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'

end
