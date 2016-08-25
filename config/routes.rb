Rails.application.routes.draw do
  get 'stylesheets/new'

  root 'stylesheets#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
