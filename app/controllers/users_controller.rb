class UsersController < ApplicationController
  def index
    
  end
  
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.organisation = current_user.organisation
    if user.save
      user = User.includes(:organisation).find_by_email(user.email)
      UserMailer.welcome_email(user).deliver
      flash[:success] = "User, #{user.name}, has successfully been created. Please follow the confirmation email that was sent to #{user.email}"
      redirect_to root_url
    else
      render "new"
    end
  end
  
  def verify
    user = User.verify(params[:email], params[:verification_code])
    if user
      Apartment::Tenant.switch(user.organisation.tenant_name)
      session[:user_id] = user.id
      flash[:success] = "Your user account has successfully been verified. Welcome #{user.name}"
    else
      flash[:danger] = "The verification failed for #{params[:email]}"
    end
    redirect_to root_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
