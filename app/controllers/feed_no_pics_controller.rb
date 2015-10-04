class FeedNoPicsController < ApplicationController

  def index
    @feed_no_pics  = FeedEntry.all
  end

end
