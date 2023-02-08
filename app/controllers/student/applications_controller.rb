class Student::ApplicationsController < ApplicationController


  def create
    @offer = Offer.find(params[:offer_id])
    @application = Application.new(application_params)
    @application.student = current_student # user est associé à la création du booking (renter vient de la db)
    @application.offer = @offer

    if @application.save
      redirect_to student_offer_path(@offer), notice: "your application has been sent !"
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
    params.require(:application).permit(:description, :student_id, :offer_id, :dossiers)   # A configurer plutard
  end

end
