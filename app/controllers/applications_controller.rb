class ApplicationsController < ApplicationController
 
  # before_action :authenticate_company!, only: %i[new create]



  # def create
  #   @offer = Offer.find(params[:offer_id])
  #   @application = Application.new(application_params)
  #   @application.student = current_student # user est associé à la création du booking (renter vient de la db)
  #   @application.offer = @offer

  #   if @application.save
  #     redirect_to offer_path(@offer), notice: "your application has been sent !"
  #   else
  #     render :new, status: :unprocessable_entity
  #   end


  # end

  # def new
  #   @application = Application.new
  #   @offer = Offer.find(params[:offer_id])
  # end

  def show
    @application = Application.find(params[:id])
    @offer = @application.offer
  end



  private

  def application_params
    params.require(:application).permit(:description, :student_id, :offer_id)   # A configurer plutard
  end

  def set_application
    @application = Application.find(params[:id])
  end

end
