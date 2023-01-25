class Student::OffersController < ApplicationController





  def show
    @offer = Offer.find(params[:id])
    @offers = Offer.all
    @savedoffer = Savedoffer.new
  end

  private

  def offer_params
    params.require(:offer).permit(:description, :function, :company_id)
  end



end
