Rails.application.routes.draw do

 
  devise_for :users
    # namespace:'admin' do 
    #   resources :coffees
    # end
    namespace :admin do
      root "coffees#index"
      resources :coffees
    end
    root "coffee#index"
    resources :coffees, :only => [:index, :show]  do
    end  

   
end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
