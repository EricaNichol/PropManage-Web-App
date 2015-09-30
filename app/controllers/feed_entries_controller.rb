class FeedEntriesController < ApplicationController

  def index
    @feedentries = FeedEntry.all
  end
  
end
