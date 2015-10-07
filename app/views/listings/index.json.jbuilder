json.array!(@listings) do |listing|
  json.extract! listing, :id, :description, :address, :price, :postal, :city, :country, :user_id
  json.url listing_url(listing, format: :json)
end
