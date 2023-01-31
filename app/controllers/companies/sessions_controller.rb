# frozen_string_literal: true

class Companies::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  before_action :configure_permitted_parameters

  # # POST /resource/sign_in
  # def create
  #   raise
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end




    # def create


    #   @company = Company.find_by_email(params[:company][:email])

    #   unless @company.valid_password?(params[:company][:password]) == true

    #     redirect_to new_company_session_path, notice: "Mot de passe ou Adresse mail incorrect"
    #   end
    #   # @company.blank? == false &&
    # end



  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    attributes = [:email, :password]
    devise_parameter_sanitizer.permit(:sign_in, keys: attributes)
  end

  def after_sign_in_path_for(resource)
    company_dashboard_path(resource)
  end

  def after_inactive_sign_in_path_for(resource)
    company_dashboard_path(resource)
  end

end
