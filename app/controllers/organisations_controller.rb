class OrganisationsController < ApplicationController
  def new
    @organisation = Organisation.new
    @organisation.user = User.new
  end
  
  def create
#    if Organisation.create(organisation_params.merge(tenant_name: organisation_params[:name].underscore.tr(' ', '_')))
#      flash[:success] = "You have successfully been signed up"
#      redirect_to root_url
#    else
@organisation = Organisation.new
    @organisation.user = User.new
      render "new"
#    end
  end
  
  private
  
  def organisation_params
    params.require(:organisation).permit(:name, users_attributes: [:email, :password, :password_confirmation])
  end
end
