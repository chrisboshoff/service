class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      Apartment::Tenant.switch(user.organisation.tenant_name)
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{user.name}"
      redirect_to root_url
    else
      flash[:danger] = "The Email or Password you have entered is incorrect"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You have successfully logged out"
    redirect_to root_url
  end
end
