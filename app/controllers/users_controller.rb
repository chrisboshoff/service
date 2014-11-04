class UsersController < ApplicationController
  def index
    
  end
  
  def new
    @user = User.new
    @user.organisation = Organisation.new
  end

  def create
    @user = User.new(user_params)
    #if @user.save
      #UserMailer.welcome_email(user).deliver
      flash[:success] = user_params.to_s#"User, #{@user.name}, has successfully been created. Please follow the confirmation email that was sent to #{@user.email}"
      redirect_to root_url
    #else
    #  render "new"
    #end
  end
  
  def verify
    user = User.verify(params[:email], params[:verification_code])
    if user
      session[:user_id] = user.id
      flash[:success] = "Your user account has successfully been verified. Welcome #{user.name}"
    else
      flash[:danger] = "The verification failed for #{params[:email]}"
    end
    redirect_to root_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, organisation_attributes: [:id])
  end
end
