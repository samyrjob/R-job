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
      @offers = Offer.paginate(page: params[:page], per_page: 8).order('id DESC').joins(:company).where(sql_query, query: "%#{params[:query]}%")
    else
      @offers = Offer.all.paginate(page: params[:page], per_page: 8).order('id DESC')
    end

    @search = Search.new
    @towns = Offer.select(:town).map(&:town).uniq
    @sectors = Company.select(:sector).map(&:sector).uniq

    # @offers1 = Offer.paginate(page: params[:page], per_page: 8).order('id DESC')

    # @offers1 = Offer.order(created_at: :desc).page params[:page]



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
