module FeedEntriesHelper

  def feeds_json(feed)
    feeds_with_address = FeedEntry.where.not(longitude:nil, latitude: nil)
    Gmaps4rails.build_markers(feeds_with_address) do |feed, marker|
      marker.lat        feed.latitude
      marker.lng        feed.longitude
      marker.infowindow "<b>#{feed.title.truncate(20)}<b>"
    end
  end

end
