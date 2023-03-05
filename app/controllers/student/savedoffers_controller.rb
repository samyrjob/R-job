class Student::SavedoffersController < ApplicationController
  # before_action :find_offer, only: %i[create update]


  def create
    @offer = Offer.friendly.find(params[:offer_id])
    @savedoffer = Savedoffer.new(savedoffer_params)
    @savedoffer.saved = true
    @savedoffer.offer = @offer
    @savedoffer.student = current_student
    @savedoffer.save
    redirect_to student_offer_path(@offer), notice: "The offer has been saved !"
  end

  def update
    @offer = Offer.friendly.find(params[:offer_id])
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
