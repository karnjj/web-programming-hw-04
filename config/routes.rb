Rails.application.routes.draw do
  get '/', to: 'main#home'
  post 'main/test'
  get 'main/result'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
