class OffersController < ApplicationController

  # ,  :raise => false

  def index

      @offers = Offer.all


  end

  def show
    @offer = Offer.find(params[:id])
    @offers = Offer.all
  end


  # def new
  #   @offer = Offer.new
  # end

  # def create
  #   @offer = Offer.new(offer_params)
  #   @offer.company = current_company

  #   if @offer.save
  #     redirect_to offer_path(@offer), notice: "your application has been sent !"
  #   else
  #     render :new, status: :unprocessable_entity
  #   end

  # end





end
