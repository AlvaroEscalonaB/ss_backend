Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :favorite_cat_facts, only: [:create]
    end
  end
  namespace :api do
    namespace :v1 do
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
    end
  end

end
