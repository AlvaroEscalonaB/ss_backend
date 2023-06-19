Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do

      post '/login', to: "auth#login"
      
      resources :users, :only => [:show, :create, :delete] do
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

      resources :favorite_cat_facts, :only => [:create]
    end
  end

end
