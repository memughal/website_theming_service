Rails.application.routes.draw do

  post 'create' => 'stylesheets#create'

  get 'new' => 'stylesheets#new'

  root 'stylesheets#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
