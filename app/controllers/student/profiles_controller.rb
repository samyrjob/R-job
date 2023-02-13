class Student::ProfilesController < ApplicationController


  def show
    @student = current_student
  
  end

  # def update
  #   @student = current_student


  #   if @student.update(update_params)
  #     redirect_to student_profile_path(@student)
  #   else
  #     flash[:errors] = @student.errors.full_messages
  #     redirect_to student_profile_path(@student)
  #   end

  # end


  # private

  # def update_params
  #   params.require(:student).permit(:first_name, :last_name, :description, :profile, :school)
  # end





end
