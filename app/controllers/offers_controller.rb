class OffersController < ApplicationController

  # ,  :raise => false

  def index

    if params[:query].present?
      sql_query = <<~SQL
      offers.town ILIKE :query
      OR offers.function ILIKE :query
      OR companies.name ILIKE :query
      OR companies.sector ILIKE :query
    SQL
      @offers = Offer.joins(:company).where(sql_query, query: "%#{params[:query]}%")
    else
      @offers = Offer.all
    end

    @search = Search.new
    @towns = Offer.select(:town).map(&:town).uniq
    @sectors = Company.select(:sector).map(&:sector).uniq

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
