Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/teams', to: 'teams#index'
  post '/teams', to: 'teams#create'
  get '/teams/new', to: 'teams#new'
  get '/teams/:id', to: 'teams#show'
  patch '/teams/:id', to: 'teams#update'
  delete '/teams/:id', to: 'teams#destroy'
  get '/teams/:id/edit', to: 'teams#edit'
  get '/teams/:team_id/drivers', to: 'teams/drivers#index'
  post '/teams/:team_id/drivers', to: 'teams/drivers#create'
  get '/teams/:team_id/drivers/new', to: 'teams/drivers#new'

  get '/drivers', to: 'drivers#index'
  get '/drivers/:id', to: 'drivers#show'
  patch '/drivers/:id', to: 'drivers#update'
  get 'drivers/:id/edit', to: 'drivers#edit'
end
