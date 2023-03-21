class Student::ApplicationsController < ApplicationController

  # before_action :find_offer, only: %i[create new]

  def create
    @offer = Offer.friendly.find(params[:offer_id])
    @application = Application.new(application_params)
    @application.student = current_student # user est associé à la création du booking (renter vient de la db)
    @application.offer = @offer
    company = @application.offer.company

    if @application.save
      # CandidateMailer.new_application(company, @application).deliver_now
      redirect_to student_offer_path(@offer), notice: "your application has been sent !"
    else
      render :new, status: :unprocessable_entity
    end


  end

  def new
    @application = Application.new
    @offer = Offer.friendly.find(params[:offer_id])
  end



private

  def application_params
    params.require(:application).permit(:description, :student_id, :offer_id, images: [])   # A configurer plutard
  end


  # def find_offer
  #   @offer = Offer.friendly.find(params[:id])

  #   # If an old id or a numeric id was used to find the record, then
  #   # the request path will not match the post_path, and we should do
  #   # a 301 redirect that uses the current friendly id.
  #   # if request.path != offer_path(@offer)
  #   #   return redirect_to @offer, :status => :moved_permanently
  #   # end
  # end


end
