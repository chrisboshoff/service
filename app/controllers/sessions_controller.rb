class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{user.email}"
      redirect_to root_url
    else
      flash[:danger] = "The Email or Password you have entered is incorrect"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_url
  end
end
