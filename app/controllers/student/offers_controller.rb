class Student::OffersController < ApplicationController





  def show
    @offer = Offer.find(params[:id])
    @offers = Offer.all
    # @savedoffer1 = Savedoffer.find(params[:id])
    @savedoffer2 = Savedoffer.where(:student_id => current_student.id, :offer_id => @offer.id).to_a.last
    @savedoffer1 = Savedoffer.new
    # raise

  end



  private

  def offer_params
    params.require(:offer).permit(:description, :function, :company_id)
  end

  def savedoffer_params
    params.require(:savedoffer).permit(:saved, :student_id, :offer_id)
  end



end
