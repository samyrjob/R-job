class Student::SavedoffersController < ApplicationController





  def create
    @offer = Offer.find(params[:offer_id])
    @savedoffer = Savedoffer.new(savedoffer_params)
    @savedoffer.saved = true
    @savedoffer.offer = @offer
    @savedoffer.student = current_student
    @savedoffer.save
    redirect_to student_offer_path(@offer), notice: "The offer has been saved !"
  end

  def update
    @offer = Offer.find(params[:offer_id])
    @savedoffer = Savedoffer.find(params[:id])

    if @savedoffer.saved == true
      @savedoffer.update(:saved => false)
      redirect_to student_offer_path(@offer), notice: "The offer is unsaved !"
    else
      @savedoffer.update(:saved => true)
      redirect_to student_offer_path(@offer), notice: "The offer has been saved !"
    end

    # @savedoffer.saved = false


    # redirect_to student_offer_path(@offer)


    # , notice: "saved offer ! "
  end

  private

  def savedoffer_params
    params.require(:savedoffer).permit(:saved, :student_id, :offer_id)
  end



end
