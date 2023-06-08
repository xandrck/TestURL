Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'urls#new'

  post '/', to: 'urls#create'
  get '/:token', to: 'urls#show', as: :show_url
  get '/:token/info', to: 'urls#info'
end
