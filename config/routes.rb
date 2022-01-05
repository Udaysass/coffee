Rails.application.routes.draw do

  get 'carts/show'
 #devise_for :users
    # namespace:'admin' do 
    #   resources :coffees
    # end
    namespace :admin do
      root "coffees#index"
      resources :coffees
    end
    root "coffees#index"
    resources :coffees, :only => [:index, :show]  do
    end  

    get 'carts/:id' => "carts#show", as: "cart"
    #delete 'carts/:id' => "carts#destroy"

end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
