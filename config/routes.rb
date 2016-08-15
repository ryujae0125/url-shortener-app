Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
     authenticated :user do
       root 'links#index', as: :authenticated_root
     end

     unauthenticated do
       root 'devise/registrations#new', as: :unauthenticated_root
     end
   end

   get '/' => 'links#index'
   get '/new' => 'links#new'
   post '/' => 'links#create'
   get '/show/:id' => 'links#show'
   get '/show/:id/edit' => 'links#edit'
   patch '/show/:id' => 'links#update'
   delete '/show/:id' => 'links#destroy'

   get '/:slug' => 'visits#create'
end
