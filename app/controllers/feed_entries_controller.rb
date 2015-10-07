class FeedEntriesController < ApplicationController

  def index
    @feedentries = FeedEntry.all
    if params[:search]
      @feedentries = FeedEntry.search(params[:search]).page(params[:page]).per(10)
    else
      @feedentries = FeedEntry.page(params[:page]).per(10)
    end
  end

  def show

  end

end
