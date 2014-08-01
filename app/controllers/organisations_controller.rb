class OrganisationsController < ApplicationController
  def new
    flash.clear
    @organisation = Organisation.new
    @organisation.users.build
    @organisation
  end
 
  
  def create
    @organisation = Organisation.new(organisation_params)
    @pop = organisation_params
    #@organisation.build_user(organisation_params[:user])
    if @organisation.save
      Apartment::Tenant.create(organisation_params[:tenant_name])
      @organisation.user = @organisation.users.first
      if @organisation.save
        flash[:success] = "You have successfully been signed up, please follow the confirmation email that was sent to #{@organisation.user.email}"
      else
        flash[:warning] = "You have successfully been signed up, but your primamry user has not been set up."
      end
        redirect_to root_url
    else
      render "new"
    end
  end
  
  private
  
  def organisation_params
    white_list = params.require(:organisation).permit(:name, :tenant_name, users_attributes: [:email, :name, :surname, :password, :password_confirmation])
    
    tenant_name = white_list[:name].underscore.tr(' ', '_')
    white_list.merge(tenant_name: tenant_name)
  end
end
