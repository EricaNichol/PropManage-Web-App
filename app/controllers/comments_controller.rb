class CommentsController < ApplicationController
before_action :find_commentable


  def create
    @comment              = Comment.new comments_params
    @comment.commentable  = @commentable
    if @comment.save
      redirect_to @commentable, notice: "Comment Created!"
    else
      folder_name = @commentable.class.name.underscore.pluralize
      render "#{folder_name}/show"
    end
  end

  private

  def find_commentable
    params[:listing_id]
      @commentable    = Listing.find(params[:listing_id])
      @listing        = @commentable
    end

  def comments_params
    params.require(:comment).permit(:content)
  end

end
