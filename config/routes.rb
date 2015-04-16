Rails.application.routes.draw do
	
  resources :todo_lists do
    resources :todo_items do
      member do
        post  :sort
        post  :update_content
        patch :complete
        patch :uncomplete
    	end
    end
  end
  
  root "todo_lists#index"
end