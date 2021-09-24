Rails.application.routes.draw do
  get 'home/about'
  root 'home#index'
  get 'home/countries'
 # resources :holidays, :collection => { :export => :get}
  resources :holidays do
    get 'get_holidays', on: :collection
    end
end
