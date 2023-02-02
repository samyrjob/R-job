class Student::ProfilesController < ApplicationController

  def show
    @student = current_student
  end

  def update
    @student = current_student
    redirect_to student_profile_path(@student)
  end





end
