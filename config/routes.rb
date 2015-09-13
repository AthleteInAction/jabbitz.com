Rails.application.routes.draw do

	# API
  	namespace :api do
  		namespace :v1 do

  			# API INSERT
			resources :google,path: 'googles'
			resources :social,path: 'socials'
			resources :chime,path: 'chimes'
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
	get '/access/request',to: 'sessions#request_password_reset', as: 'request'
	post '/access/request',to: 'sessions#request_password_send_email'
	get '/access/new_password',to: 'sessions#set_new_password', as: 'new_password'
	post '/access/new_password',to: 'sessions#change_password'

	get 'angularjs/templates/:page',to: 'angularjs#index'

	get 'admin',to: 'admin#index'

end