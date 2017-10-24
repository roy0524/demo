Rails.application.routes.draw do
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get "welcome/say_hello" => "welcome#say"
get "welcome" => "welcome#index"
root :to => "welcome#index"
#match ':controller(/:action(/:id(.:format)))', :via => :all
resources :events do

  resources :attendees, :controller => 'event_attendees'
  resource :location, :controller => 'event_locations'

  collection do
    post :bulk_delete
    post :bulk_update
  end

  member do
    get :dashboard
    post :join
    post :withdraw
  end
  end
  
  namespace :admin do
    resources :events
  end

end
