class OffersController < ApplicationController
  skip_before_action :authenticate_company!, only: %i[index show]
  before_action :authenticate_company!, only: %i[new]
  skip_before_action :authenticate_student!, only: %i[index show]
  # ,  :raise => false

  def index

      @offers = Offer.all

  end

  def show
    @offer = Offer.find(params[:id])
    @application = Application.new
    @offers = Offer.all
  end


  def new
    @offer = Offer.new
  end


  # private

  # def offer_params
  #   params.require(:flat).permit(:name, :description, :price_per_day, :town, :photo)
  # end
end
