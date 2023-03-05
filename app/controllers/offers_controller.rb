class OffersController < ApplicationController
  before_action :find_offer, only: [:show]
  # ,  :raise => false

  def index

    if params[:query].present?
      sql_query = <<~SQL
      offers.town ILIKE :query
      OR offers.function ILIKE :query
      OR companies.name ILIKE :query
      OR companies.sector ILIKE :query
    SQL
      @offers = Offer.where(status: "accepted").paginate(page: params[:page], per_page: 8).order('id DESC').joins(:company).where(sql_query, query: "%#{params[:query]}%")
    else
      @offers = Offer.where(status: "accepted").paginate(page: params[:page], per_page: 8).order('id DESC')
    end

    @search = Search.new
    @towns = Offer.select(:town).map(&:town).uniq
    @sectors = Company.select(:sector).map(&:sector).uniq


    @capacities = Offer.select(:start_date)

    # @offers.each do |offer|
      # case offer.start_date.month

      # when 1
      #   @month = "Janvier"
      # when 2
      #   @month = "Février"
      # when 3
      #   @month = "Mars"
      # when 4
      #   @month = "Avril"
      # when 5
      #   @month = "Mai"
      # when 6
      #   @month = "Juin"
      # when 7
      #   @month = "Juillet"
      # when 8
      #   @month = "Août"
      # when 9
      #   @month = "Septembre"
      # when 10
      #   @month = "Octobre"
      # when 11
      #   @month = "Novembre"
      # else
      #   @month = "Décembre"
      # end


    # @offers1 = Offer.paginate(page: params[:page], per_page: 8).order('id DESC')

    # @offers1 = Offer.order(created_at: :desc).page params[:page]



  end

  def show
    # @offer = Offer.find(params[:id])
    @offers = Offer.all

    capacity = @offer.start_date.month
    set_meta_tags title: @offer.function,
                  reverse: true

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


private

  def find_offer
    @offer = Offer.friendly.find(params[:id])

    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    if request.path != offer_path(@offer)
      return redirect_to @offer, :status => :moved_permanently
    end
  end


end
