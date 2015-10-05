class FeedNoPicsController < ApplicationController

  def index
    @feed_no_pics  = FeedEntry.page(params[:page])
  end

end
