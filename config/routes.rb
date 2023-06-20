Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do

      post '/login', to: "auth#login"
      post '/sign-up', to: "users#create"
      
      resources :users, :only => [:show, :delete] do
        collection do
          get :user_favorites
        end
      end

      resources :cat_facts, :only => [:create] do
        collection do
          get :favorites
        end
        member do
          post :set_favorite
        end
      end

      resources :favorite_cat_facts, :only => [:create, :destroy]
    end
  end

end
