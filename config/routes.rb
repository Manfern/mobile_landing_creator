Rails.application.routes.draw do
  get '/pages/:page_id/offers/:id/edit', to:'offers#edit', method: patch
  root 'pages#index'

  resources :pages do
    resources :offers
    resources :feedbacks
    resources :advantages
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
