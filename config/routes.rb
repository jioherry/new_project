Rails.application.routes.draw do
 
  devise_for :users
	resources :events do	
  		resources :attendees, controller: 'event_attendees'

  		collection do
  			get :latest
  			post :bulk_update
		end

		member do
			get :dashboard
		end
	end

	namespace :admin do
		resources :events # :controller => "admin::events" <- 這是預設值，可以省略
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root :to => 'events#index'
end
