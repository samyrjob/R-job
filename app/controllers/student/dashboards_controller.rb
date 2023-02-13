class Student::DashboardsController < ApplicationController
  before_action :set_student, only: [:show]

  def show

    @applications = @student.applications
    # @offers = Offer.where(:saved = true)
    # @savedoffers = Savedoffer.where(student_id: @student.id)
    # @savedoffers = @student.savedoffers.distinct.pluck(:offer_id)
    @savedoffers = @student.savedoffers.where(:saved => true).distinct.pluck(:offer_id)
    @tag = Tag.new 
    @applications.each do |application|
      case application.offer.start_date.month

      when 1
        @month = "Janvier"
      when 2
        @month = "Février"
      when 3
        @month = "Mars"
      when 4
        @month = "Avril"
      when 5
        @month = "Mai"
      when 6
        @month = "Juin"
      when 7
        @month = "Juillet"
      when 8
        @month = "Août"
      when 9
        @month = "Septembre"
      when 10
        @month = "Octobre"
      when 11
        @month = "Novembre"
      else
        @month = "Décembre"
      end

    end
  end

  private

  def set_student
    @student = current_student
  end
end
