module ListingsHelper

    def listings_json(listings)
      listings_with_address = Listing.where.not(longitude:nil, latitude: nil)
      Gmaps4rails.build_markers(listings_with_address) do |listing, marker|
        marker.lat        listing.latitude
        marker.lng        listing.longitude
        marker.infowindow "<b>#{listing.description.truncate(20)}<b>"
      end
    end

end
