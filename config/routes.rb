Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  resources :users, only: %w(create update) 
  resources :organizations, only: %w(create index update show) do
    resources :users, only: %w(index) do
      resources :shifts, only: %w(index) 
    end 
  end
  resources :shifts, only: %w(create)

  get '/organizations/:name', to: 'organizations#show'
  patch '/leave_organization/:user_id', to: 'users#leave_organization'
  patch '/join_organization/:id', to: 'organizations#join_organization'  

end
