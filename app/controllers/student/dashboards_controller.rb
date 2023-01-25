class Student::DashboardsController < ApplicationController
  before_action :set_student, only: [:show]
  skip_before_action :authenticate_company!, only: %i[show ]
  skip_before_action :authenticate_student!, only: %i[show ]

  def show
    
    @applications = @student.applications
  end

  private

  def set_student
    @student = current_student
  end
end
