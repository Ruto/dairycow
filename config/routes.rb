Rails.application.routes.draw do


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, defaults: { format: :json } do
      resources :milkings do
        collection do
          put 'confirm_milking'
        end
      end
      resources :shades
      resources :cows
      resources :roles
      resources :dairies
      resources :cow_dairies
      resources :invitations do
         collection do
           get 'get_user_record'
           get 'unconfirmed_invites'
           put 'confirm_invite'
           put 'revoke_invite'
           put 'admin_confirmation'
         end
     end

     namespace :milkings do
         resources :first_milking, :second_milking, :third_milking, :fourth_milking, :controller => 'milkings' #, :except => [:destroy, :edit, :update ]
     end

     resources :users, only: [:create, :show]  do
        collection do
          get  'unconfirmed_users'
          post 'confirm'
          post 'login'
        end
      end

  end

end
