class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to feed_entries_path, notice: "Signed in Succesfully"
    else
      render :new
      flash[:alert] = "Wrong Credentials"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
