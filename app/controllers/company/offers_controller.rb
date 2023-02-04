class Company::OffersController < ApplicationController




  def new
    @offer = Offer.new
    @company = current_company
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.company = current_company
    if @offer.save
      redirect_to "/", notice: "your application has been sent !"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @offer = Offer.find(params[:id])
    @offers = Offer.all
  end


  def update
  end

  
  private

  def offer_params
    params.require(:offer).permit(:description, :function, :town, :salary, :duration, :start_date)
  end

end
