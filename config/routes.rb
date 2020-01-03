Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
     resources :invitations do
       collection do
         get 'user_record'
         get 'unconfirmed_invites'
       end
     end
     resources :dairies
     resources :users, only: :create  do
        collection do
          get  'unconfirmed_users'
          post 'confirm'
          post 'login'
        end
      end

  end

end
