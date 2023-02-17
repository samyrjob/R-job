# frozen_string_literal: true

class Companies::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end


  def create
    @company = Company.find_by(email: params[:email])

    if @company.present?
    end

    redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password"
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
