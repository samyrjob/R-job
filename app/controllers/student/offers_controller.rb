class Student::OffersController < ApplicationController





  def show
    @offer = Offer.find(params[:id])
    @offers = Offer.all
    # @savedoffer1 = Savedoffer.find(params[:id])
    @savedoffer2 = Savedoffer.where(:student_id => current_student.id, :offer_id => @offer.id).to_a.last
    @savedoffer1 = Savedoffer.new
    # raise

    capacity = @offer.start_date.month

    case capacity
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



  private

  def offer_params
    params.require(:offer).permit(:description, :function, :company_id)
  end

  def savedoffer_params
    params.require(:savedoffer).permit(:saved, :student_id, :offer_id)
  end



end
