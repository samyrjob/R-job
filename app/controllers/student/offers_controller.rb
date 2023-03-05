class Student::OffersController < ApplicationController

  before_action :find_offer, only: [:show]



  def show
    # @offer = Offer.find(params[:id])
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


  def find_offer
    @offer = Offer.friendly.find(params[:id])

    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    # if request.path != offer_path(@offer)
    #   return redirect_to @offer, :status => :moved_permanently
    # end
  end

end
