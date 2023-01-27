class Student::DashboardsController < ApplicationController
  before_action :set_student, only: [:show]

  def show

    @applications = @student.applications
    @savedoffers = Savedoffer.where(student_id: @student.id)
  end

  private

  def set_student
    @student = current_student
  end
end
