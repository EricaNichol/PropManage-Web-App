json.array!(@listings) do |listing|
  json.extract! listing, :id, :description, :address, :suite_no, :postal, :city, :country, :user_id
  json.url listing_url(listing, format: :json)
end
