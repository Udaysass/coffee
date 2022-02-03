Rails.application.routes.draw do

  devise_for :users
    # namespace:'admin' do 
    #   resources :coffees
    # end
  namespace :admin do
    root "coffees#index"
    resources :coffees
  end
  root "dashboard#index"
  resources :coffees, :only => [:index, :show]  do
  end  
  resources :payments
  resources :orders do
  resources :reviews
  end
  get 'thanks', to: 'orders#thanks'
  get 'carts/:id' => "carts#show", as: "cart"
  post "orders/confirm/:id", to: "orders#confirm", as: "confirm"
  post "coffees/add_to_cart/:id", to: "coffees#add_user_card", as: "add_user_card"
  delete "coffees/remove_from_cart/:id", to: "coffees#remove_user_card", as: "remove_user_card"
  get 'show_all_carts', to: 'dashboard#show_all_carts'
end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
