Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  get '/shelters/:id/delete', to: 'shelters#destroy'
  get '/pets', to: 'pets#index'
  get '/shelters/:id/pets', to: 'pets#show_pets'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:id/pets/new', to: 'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  get '/pets/:id/delete', to: 'pets#destroy'
  get 'shelters/:id/pets/:id', to: 'pets#show'
  get "/:id/pets", to: 'pets#show_pets'

end
