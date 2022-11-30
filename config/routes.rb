Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/teams', to: 'teams#index'
  get '/teams/:id', to: 'teams#show'
  get '/drivers', to: 'drivers#index'
  get '/drivers/:id', to: 'drivers#show'
  get '/teams/:team_id/drivers', to: 'team_drivers#index'
end
