# frozen_string_literal: true

class Companies::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  before_action :configure_permitted_parameters


  def update
    @company = current_company


    if @company.update(update_params)
      redirect_to company_profile_path(@company)
    else

      # redirect_to student_profile_path(@student),  error: "An error message for the user"
      redirect_to company_profile_path(@company) , :flash => { :error => "Insufficient rights!" }

    end

  end

  def update_params
    params.require(:company).permit(:name, :photo, :email, :sector, :description, :structure, :website)
  end


  protected

  def configure_permitted_parameters
    attributes = [:sector, :email, :photo, :name, :structure, :website]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end



  def after_sign_up_path_for(resource)
    company_dashboard_path(resource)
  end

  def after_inactive_sign_up_path_for(resource)
    company_dashboard_path(resource)
  end

  def after_update_path_for(resource)
    flash[:notice] = "Account succesfully updated"
    company_profile_path
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


  # The path used after sign up.
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
