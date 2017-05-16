Rails.application.routes.draw do
	resources :localities do 
		resources :streets do 
			resources :houses do
				resources :appartaments do
					resources :comments
				end
			end
		end
	end
	get 'instant_add/:id', :to => 'houses#instant_add', :as => :instant_add
	post 'instant_add/:id', :to => 'houses#add_comment', :as => :instant_add_create
	get 'instant_add_private/:id', :to => 'houses#instant_add_to_private', :as => :instant_add_private
	post 'instant_add_private/:id', :to => 'houses#add_comment_to_private', :as => :instant_add_private_create
end
