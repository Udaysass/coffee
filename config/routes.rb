Rails.application.routes.draw do

  get 'dashbord/index'
  get 'carts/show'
  devise_for :users
    # namespace:'admin' do 
    #   resources :coffees
    # end
    namespace :admin do
      root "coffees#index"
      resources :coffees
    end
    root "dashbord#index"
    resources :coffees, :only => [:index, :show]  do
    end  

    get 'carts/:id' => "carts#show", as: "cart"
    #delete 'carts/:id' => "carts#destroy"
    post "coffees/add_to_cart/:id", to: "coffees#add_user_card", as: "add_user_card"
    delete "coffees/remove_from_cart/:id", to: "coffees#remove_user_card", as: "remove_user_card"
    get 'show_all_carts', to: 'dashbord#show_all_carts'

end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
