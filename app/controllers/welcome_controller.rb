class WelcomeController < ApplicationController

  def index
    @users        = User.all
    @feedentries  = FeedEntry.all
    @listings     = Listing.all
  end


end
