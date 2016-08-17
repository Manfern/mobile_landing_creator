Rails.application.routes.draw do
  devise_for :admins
  root 'pages#index'

  resources :pages do
    resources :offers do
      collection do
        get :edit_all
        put :update_all
        post :update_all
      end
    end
    resources :feedbacks do
      collection do
        get :edit_all
        put :update_all
        post :update_all
      end
    end
    resources :advantages do
      collection do
        get :edit_all
        put :update_all
        post :update_all
      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
