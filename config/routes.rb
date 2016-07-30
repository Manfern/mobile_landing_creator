Rails.application.routes.draw do
  get 'offers/index'

  get 'offers/new'

  get 'offers/create'

  get 'offers/show'

  get 'offers/update'

  get 'offers/destroy'

  get 'feedbacks/index'

  get 'feedbacks/new'

  get 'feedbacks/create'

  get 'feedbacks/show'

  get 'feedbacks/update'

  get 'feedbacks/destroy'

  get 'advantages/index'

  get 'advantages/new'

  get 'advantages/create'

  get 'advantages/show'

  get 'advantages/update'

  get 'advantages/destroy'

  root 'pages#index'
  get 'pages/index'

  get 'pages/show'

  get 'pages/create'

  get 'pages/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
