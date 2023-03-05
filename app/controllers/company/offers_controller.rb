class Company::OffersController < ApplicationController

  before_action :find_offer, only: %i[accept decline edit update show destroy]

  def accept
    @offers = Offer.where(status: "pending")
    # @offer = Offer.find(params[:id])
    @offer.update(:status => 'accepted')
    redirect_to company_dashboard_path(current_company), notice: "L'offre est désormais en ligne !"
  end

  def decline
    @offers = Offer.where(status: "pending")
    # @offer = Offer.find(params[:id])
    @offer.update(:status => 'declined')
    redirect_to company_dashboard_path(current_company), notice: "L'offre ne sera pas publiée en ligne !"
  end

  def new
    @offer = Offer.new
    @company = current_company
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.company = current_company
    @offer.status = "pending"
    if @offer.save
      redirect_to "/", notice: "Votre offre de stage sera examinée et publiée sous peu !"
    else
      render :new, status: :unprocessable_entity
    end


  end

  def edit
    # @offer = Offer.find(params[:id])
  end

  def update
    # @offer = Offer.find(params[:id])
    @offer.update(offer_params)

    if @offer.save
      redirect_to company_offer_path(@offer), notice: "your application has been updated !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show





    # @offer = Offer.find(params[:id])

   @applications =  @offer.applications.where(status: "pending")
   @applications1 =  @offer.applications.where(status: "accepted")
   @applications2 = @offer.applications.where(status: "nokept")
   @applications3 = @applications1 + @applications2
   @applications4 = @offer.applications.where(status: "kept")

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

  def destroy
    # @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to company_dashboard_path, status: :see_other, notice: "L'annonce a bien été supprimée !"
  end




  private

  def offer_params
    params.require(:offer).permit(:description, :function, :town, :salary, :duration, :start_date)
  end


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
