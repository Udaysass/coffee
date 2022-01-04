Rails.application.routes.draw do

 #devise_for :users
      root "coffees#index"
    # namespace:'admin' do 
    #   resources :coffees
    # end
    namespace :admin do
      resources :coffees
    end  
end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
