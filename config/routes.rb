Rails.application.routes.draw do
  resources :holidays
  #get 'home/index'
  get 'home/about'
  root 'home#index'
  get 'home/countries'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
