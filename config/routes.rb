Rails.application.routes.draw do

  root 'home#index'
  resources :books
  resources :students
  resources :librarians
  resources :book_issues
  post 'search', to: "books#search"
  post 'searchbook', to: "students#searchbook"
  post 'searchuser', to: "books#searchuser"
  get 'mydashbord', to: "students#mydashbord"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
