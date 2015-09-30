class FeedEntriesController < ApplicationController

  def index
    @feedentries = FeedEntry.all
    @listings    = Listing.all
  end

end
