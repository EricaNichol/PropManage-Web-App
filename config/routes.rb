Rails.application.routes.draw do

root 'welcome#index'

resources :users

resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
end

resources :listings do
  resources :comments, only: [:create]
end


resources :feed_entries, only: [:index]



end
