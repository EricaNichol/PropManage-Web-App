Rails.application.routes.draw do

root 'welcome#index'
  get '/search/:search' => 'search#index'
  get "/auth/twitter"
  get "/auth/:provider/callback" => "callbacks#index"

resources :users do
  resources :listings
end

resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
end

resources :listings do
  resources :comments, only: [:create]
end


resources :feed_entries, only: [:index]

resources :feed_no_pics, only: [:index]

end
