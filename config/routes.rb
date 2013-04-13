EmberRailsDevise::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  root to: 'home#index'
end
