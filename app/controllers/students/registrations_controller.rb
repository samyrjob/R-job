# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
  # before_action :sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  before_action :configure_permitted_parameters




    # def create
    #   @student = Student.new(sign_up_params)
    #   # session[:id] = @student.id
    #   respond_to do |format|
    #     if @student.save
    #       format.html { redirect_to student_dashboard_path(@student), notice: 'Your Account was successfully created' }
    #       format.json { render :@student.json }
    #     else
    #       format.html { render :new }
    #       format.json { render json: @student.errors, status: :unprocessable_entity }
    #     end
    #   end

    # end

  def update
    @student = current_student


    if @student.update(update_params)
      redirect_to student_profile_path(@student)
    else

      # redirect_to student_profile_path(@student),  error: "An error message for the user"
      redirect_to student_profile_path(@student) , :flash => { :error => "Insufficient rights!" }

    end

  end




  def update_params
    params.require(:student).permit(:first_name, :last_name, :description, :profile, :school, :photo, :disponibility, :linkedin, :phone_number, :year, :mobility, :wanted_area)
  end




    protected

    # def sign_up_params
    #     params.require(:student).permit(:email, :first_name, :last_name, :photo, :profile, :school, :tongues, :password, :password_confirmation, :student_id)
    # end

    def after_sign_up_path_for(resource)
      new_student_session_path
    end

    def after_inactive_sign_up_path_for(resource)
      new_student_session_path
    end

  def configure_permitted_parameters
    # @profile = params.require(:student).permit(:profile)
    attributes = [:first_name, :last_name, :email, :photo, :profile, :school, :tongues, :password, :password_confirmation, :description, :phone_number, :year, :disponibility, :linkedin, :mobility, :wanted_area]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def after_update_path_for(resource)
    flash[:notice] = "Account succesfully updated"
    student_profile_path
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # GET /resource/sign_up
  # def new
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
