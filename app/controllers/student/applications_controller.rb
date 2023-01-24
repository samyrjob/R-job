class Student::ApplicationsController < ApplicationController
  skip_before_action :authenticate_student!, only: %i[new create]
  skip_before_action :authenticate_company!, only: %i[new show create]

  def create
    @offer = Offer.find(params[:offer_id])
    @application = Application.new(application_params)
    @application.student = current_student # user est associé à la création du booking (renter vient de la db)
    @application.offer = @offer

    if @application.save
      redirect_to offer_path(@offer), notice: "your application has been sent !"
    else
      render :new, status: :unprocessable_entity
    end


  end

  def new
    @application = Application.new
    @offer = Offer.find(params[:offer_id])
  end



private

  def application_params
    params.require(:application).permit(:description, :student_id, :offer_id)   # A configurer plutard
  end

end
