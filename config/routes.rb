Rails.application.routes.draw do
	devise_for :users

	root to: "outer_pages#index"
	
	resources :orgs
end
