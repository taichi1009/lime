Rails.application.routes.draw do


  devise_for :users
root 'top#index'
 get 'limes' =>'top#index'
 get 'limes/new' => 'top#new'
 post 'limes' => 'top#create'
end
