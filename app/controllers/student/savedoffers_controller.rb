class Student::SavedoffersController < ApplicationController





  def create
    @offer = Offer.find(params[:offer_id])
    @savedoffer = Savedoffer.new(savedoffer_params)
    @savedoffer.saved = true
    @savedoffer.offer = @offer
    @savedoffer.student = current_student
    @savedoffer.save
    redirect_to student_offer_path(@offer), notice: "The offer has has been saved !"
  end

  private

  def savedoffer_params
    params.require(:savedoffer).permit(:saved, :student_id, :offer_id)
  end

end
