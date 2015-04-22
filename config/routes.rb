Rails.application.routes.draw do

	# API
  	namespace :api do
  		namespace :v1 do

  			# API INSERT
			resources :social,path: 'socials'
			resources :user,path: 'users'
			post 'users/:id',to: 'user#change_profile_image'

  		end
  	end

  	resources :users

	root 'main#index'
	post '/',to: 'main#create'

	get '/access/logout',to: 'sessions#destory', as: 'logout'
	get '/access/normal',to: 'sessions#new', as: 'login'
	post '/access/normal',to: 'sessions#create'

	get 'angularjs/templates/:page',to: 'angularjs#index'

end