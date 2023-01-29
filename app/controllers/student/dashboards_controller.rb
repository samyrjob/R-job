class Student::DashboardsController < ApplicationController
  before_action :set_student, only: [:show]

  def show

    @applications = @student.applications
    # @offers = Offer.where(:saved = true)
    # @savedoffers = Savedoffer.where(student_id: @student.id)
    # @savedoffers = @student.savedoffers.distinct.pluck(:offer_id)
    @savedoffers = @student.savedoffers.where(:saved => true).distinct.pluck(:offer_id)
  end

  private

  def set_student
    @student = current_student
  end
end
