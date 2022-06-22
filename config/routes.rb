Rails.application.routes.draw do
  get 'home_page/index'
  root 'home_page#index' 
  get "/extracted_info", to:"extracted_info#index"
  get "saved_info/index"
  post "extracted_info", to:"extracted_info#index"
  post "home_page", to: "home_page#index"
  post "saved_info", to: "saved_info#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
