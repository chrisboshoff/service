class OrganisationsController < ApplicationController
  def new
    @organisation = Organisation.new
    @organisation.user = User.new
  end
  
  def create
    @organisation = Organisation.new(user_params)
    if @user.save
      flash[:success] = "You have successfully been signed up"
      redirect_to root_url
    else
      render "new"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
