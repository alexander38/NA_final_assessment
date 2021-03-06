Rails.application.routes.draw do

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'calculators#index'
 post "/calculators/calculator" =>'calculators#calculator'

 resources :users
 resources :sessions
 resources :charges


# these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

# These routes will be for signup. The first renders a form in the browse, the second will 
# receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'



  resources :users, controller: "users", only: :show
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end
