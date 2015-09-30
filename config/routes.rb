Rails.application.routes.draw do

root 'welcome#index'

resources :users

resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
end

resources :listings
resources :feed_entries, only: [:index]

resources :nearby_listings, only: [:index]

end
