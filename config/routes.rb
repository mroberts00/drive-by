Rails.application.routes.draw do
  root 'shootings#new', as: 'shooting_new'
  resources :victims
  resources :shootings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
