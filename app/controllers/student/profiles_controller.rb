class Student::ProfilesController < ApplicationController

  def show
    @student = current_student
  end

  

end
